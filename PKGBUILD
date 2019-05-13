# Maintainer: Scott Dickson < scottfoesho@gmail.com >

pkgname=kodi-addon-embyrepo
pkgver=1.0.5
pkgrel=2
pkgdesc='This repo contains the Kodi Emby addon along with compatible Kodi skins'
_reponame=repository.emby.kodi
arch=('any')
url='https://github.com/MediaBrowser/plugin.video.emby/wiki/Emby-Repository'
license=('GPL2')
depends=('kodi')
source=("http://kodi.emby.media/repository.emby.kodi-${pkgver}.zip")
sha256sums=('96f63c41b431181777e556342b05695b638c0ac77ac52f2d2c867466fc1ce66f')
makedepends=('unzip')

prepare() {
  cd $srcdir
}

package() {
  mkdir -p "$pkgdir/usr/share/kodi/addons/"
  cp -r "${srcdir}/${_reponame}" "$pkgdir/usr/share/kodi/addons/"
  find "$pkgdir/usr/share/kodi/addons/${_reponame}" -type f -exec chmod 644 {} \;
}
