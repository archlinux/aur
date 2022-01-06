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
  mkdir -p $pkgdir/usr/share/openseeface-gd
  cp -rf $(ls . | grep -v "${pkgname}-${pkgver}.zip") $pkgdir/usr/share/openseeface-gd
  chmod 755 -R $pkgdir/usr/share/openseeface-gd/*
  mkdir -p $pkgdir/usr/bin
  # i know this is absolutely not to the correct way to create a symlink / a binary in /usr/bin with pkgbuild.
  # it will always fail if you just want to test the package and not install it but i have no idea how to force a symlink to "follow" the original file if it gets copied (if it is even possible)
  ln -sf /usr/share/openseeface-gd/OpenSeeFaceGD.x86_64 $pkgdir/usr/bin/openseeface-gd
  chmod 755 $pkgdir/usr/bin/openseeface-gd
}
