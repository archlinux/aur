# Maintainer: ByteDream
pkgname=openseeface-gd
pkgdesc="Renderer for OpenSeeFace data made with Godot 3.4"
arch=('x86_64')
url="https://github.com/you-win/openseeface-gd"
license=('MIT')

pkgver=0.7.3
pkgrel=1

source=("${pkgname}-${pkgver}.zip::https://github.com/you-win/openseeface-gd/releases/download/0.7.3/openseeface-gd_linux.zip")
sha256sums=('d7712195e4bd8178f15adae7ac96ce6e56aad997aa1937dc800f650601cd9da7')

package() {
  mkdir -p $pkgdir/usr/{share/openseeface-gd,bin}
  cp -rf $(ls . | grep -v "${pkgname}-${pkgver}.zip") $pkgdir/usr/share/openseeface-gd
  chmod 755 -R $pkgdir/usr/share/openseeface-gd/*
  ln -sf ../share/openseeface-gd/OpenSeeFaceGD.x86_64 $pkgdir/usr/bin/openseeface-gd
}
