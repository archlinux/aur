# Maintainer: Scott Dickson < scottfoesho@gmail.com >

pkgname=kodi-addon-embyrepo
pkgver=1.0.3
pkgrel=2
pkgdesc='This repo contains the Kodi Emby addon along with compatible Kodi skins'
_reponame=repository.emby.kodi
arch=('any')
url='https://github.com/MediaBrowser/plugin.video.emby/wiki/Emby-Repository'
license=('GPL2')
depends=('kodi')
source=("http://kodi.emby.media/repository.emby.kodi-${pkgver}.zip")
md5sums=('b71cd64d6517e37b3a84e2f62cbd0f70')
makedepends=('unzip')

prepare() {
  cd $srcdir
}

package() {
  mkdir -p "$pkgdir/usr/share/kodi/addons/"
  cp -r "${srcdir}/${_reponame}" "$pkgdir/usr/share/kodi/addons/"
  find "$pkgdir/usr/share/kodi/addons/${_reponame}" -type f -exec chmod 644 {} \;
}
