# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=xdman8
pkgname=$_pkgname-bin
pkgver=8.0.26
pkgrel=1
pkgdesc="Powerfull download accelerator and video downloader (binary release)"
arch=('x86_64')
url="https://github.com/subhra74/xdm"
license=('GPL3')
depends=('ffmpeg' 'gtk3>=3.22.0')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-beta-git")
source=("$url/releases/download/$pkgver/xdman_gtk-$pkgver-1.fc36.x86_64.rpm")
sha256sums=('8e3d2df476646d9fd50d533ee7ec6cd7bb61e84ec9b648c588cd705b07c49678')

package() {
  # Create folders
  mkdir -p $pkgdir/opt
  mkdir -p $pkgdir/usr/share/icons/hicolor/scalable/apps
  # Install
  cp -r opt/xdman "$pkgdir/opt/xdman"
  ln -s /opt/xdman/xdm-logo.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -Dm644 usr/share/applications/xdm-app.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm755 usr/bin/xdman -t "$pkgdir/usr/bin"
}
