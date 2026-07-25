# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=youtube-dl-gui
pkgname=$_pkgname-bin
pkgver=3.2.1
pkgrel=1
pkgdesc="Open Video Downloader - A cross-platform GUI for youtube-dl made in Rust with Tauri and Vue + Typescript"
url="https://github.com/jely2002/youtube-dl-gui"
license=('AGPL-3.0-or-later')
arch=('x86_64')
depends=("gtk3" "libayatana-appindicator" "webkit2gtk-4.1")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$url/releases/download/app-v$pkgver/Open.Video.Downloader_${pkgver}_amd64.deb")
sha256sums=('6a17c371653038e5b7ab88d25fdec407ff9532a933c8f2d755a53833761f4568')

package() {
  tar -xf data.tar.gz
  cd usr
  install -Dm755 bin/open-video-downloader -t "$pkgdir/usr/bin"
  ln -s open-video-downloader "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 share/applications/"Open Video Downloader.desktop" -t "$pkgdir/usr/share/applications"
  cd share/icons/hicolor
  install -Dm644 32x32/apps/open-video-downloader.png -t "$pkgdir/usr/share/icons/hicolor/32x32/apps"
  install -Dm644 128x128/apps/open-video-downloader.png -t "$pkgdir/usr/share/icons/hicolor/128x128/apps"
  install -Dm644 256x256@2/apps/open-video-downloader.png -t "$pkgdir/usr/share/icons/hicolor/256x256/apps"
}
