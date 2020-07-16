# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=lplayer-git
_pkgname=lplayer
pkgver=r65.e241d26
pkgrel=1
pkgdesc='A simple audio player for simply listening music or whatever you want'
arch=('any')
url='https://github.com/atareao/lplayer'
license=('MIT')
provides=('lplayer')
depends=('python-mutagen'
         'python-dbus'
         'python-requests'
         'gobject-introspection'
         'gstreamer'
         'hicolor-icon-theme')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/atareao/lplayer")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname}"
  install -d "${pkgdir}/usr/share/lplayer/lplayer" "${pkgdir}/usr/share/lplayer/icons"
  install -Dm755 bin/lplayer -t "${pkgdir}/usr/bin"
  cp -avR src/lplayer/*.py "${pkgdir}/usr/share/lplayer/lplayer"
  install -Dm644 debian/changelog -t "${pkgdir}/usr/share/lplayer"
  install -Dm644 data/lplayer-player.desktop -t "${pkgdir}/usr/share/applications"
  cp -av data/icons/*.svg "${pkgdir}/usr/share/lplayer/icons"
  cp -av data/icons/*.gif "${pkgdir}/usr/share/lplayer/icons"
  install -Dm644 data/icons/lplayer.svg -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
  install -Dm644 data/icons/8x8/lplayer.png -t "${pkgdir}/usr/share/icons/hicolor/8x8/apps"
  install -Dm644 data/icons/16x16/lplayer.png -t "${pkgdir}/usr/share/icons/hicolor/16x16/apps"
  install -Dm644 data/icons/32x32/lplayer.png -t "${pkgdir}/usr/share/icons/hicolor/32x32/apps"
  install -Dm644 data/icons/48x48/lplayer.png -t "${pkgdir}/usr/share/icons/hicolor/48x48/apps"
  install -Dm644 data/icons/96x96/lplayer.png -t "${pkgdir}/usr/share/icons/hicolor/96x96/apps"
  install -Dm644 data/icons/128x128/lplayer.png -t "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
  install -Dm644 data/icons/192x192/lplayer.png -t "${pkgdir}/usr/share/icons/hicolor/192x192/apps"
  install -Dm644 data/icons/256x256/lplayer.png -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
  install -Dm644 data/icons/512x512/lplayer.png -t "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
  install -Dm644 data/icons/1024x1024/lplayer.png -t "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et: