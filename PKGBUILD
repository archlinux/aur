# Maintainer: ByteDream
pkgname=openseeface-gd
pkgdesc="Renderer for OpenSeeFace data made with Godot 3.4"
arch=('x86_64')
url="https://github.com/you-win/openseeface-gd"
license=('MIT')

pkgver=0.8.0
pkgrel=1

source=("${pkgname}-${pkgver}.zip::https://github.com/you-win/openseeface-gd/releases/download/${pkgver}/openseeface-gd_${pkgver}_linux.zip")
sha256sums=('e9bbba86ff39b21beca0f633db571d42715ce8eb1a9fe57969d6dacadb127af9')

package() {
  mkdir -p $pkgdir/usr/{share/openseeface-gd,bin}
  cp -rf $(ls . | grep -v "${pkgname}-${pkgver}.zip") $pkgdir/usr/share/openseeface-gd
  chmod 755 -R $pkgdir/usr/share/openseeface-gd/*
  ln -sf ../share/openseeface-gd/OpenSeeFaceGD.x86_64 $pkgdir/usr/bin/openseeface-gd
}
