# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=xdman-beta
pkgname=$_pkgname-bin
pkgver=8.0.29
pkgrel=8
pkgdesc="Powerfull download accelerator and video downloader (binary release)"
arch=('x86_64')
url="https://github.com/subhra74/xdm"
license=('GPL3')
depends=('ffmpeg' 'gtk3>=3.22.0')
optdepends=('firefox-extension-xdman8-browser-monitor-bin: Browser extension for Firefox'
            'librewolf-extension-xdman8-browser-monitor-bin: Browser extension for LibreWolf')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$url/releases/download/$pkgver/xdman_gtk-$pkgver-1.fc36.x86_64.rpm")
sha256sums=('dbb47e7fbd03cc82aa4678886003d56e1d5222ecb4a52a83e0e6461fadc27ea3')

package() {
  mv opt "$pkgdir"
  install -Dm644 $pkgdir/opt/xdman/xdm-logo.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -Dm644 usr/share/applications/xdm-app.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm755 usr/bin/xdman "$pkgdir/usr/bin/$_pkgname"
}
