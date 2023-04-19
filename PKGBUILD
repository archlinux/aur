# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=xdman8
pkgname=$_pkgname-bin
pkgver=8.0.25
pkgrel=1
pkgdesc="Powerfull download accelerator and video downloader (binary release)"
arch=('x86_64')
url="https://github.com/subhra74/xdm-experimental-binaries"
license=('GPL3')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-beta-git")
source=("$url/releases/download/$pkgver-beta/xdman_gtk-$pkgver-1.fc36.x86_64.rpm")
sha256sums=('803257ce804a465e4831b9db31499117661084b6d8c3a6b41f600f48e49ee45f')

package() {
  # Create folders
  mkdir -p $pkgdir/opt
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/applications
  # Install
  cp -r opt/xdman "$pkgdir/opt/xdman"
  ln -s /opt/xdman/xdm-app "$pkgdir/usr/bin/$_pkgname"
  ln -s /opt/xdman/xdm-app.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
