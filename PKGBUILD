# Maintainer: Scott Dickson < scottfoesho@gmail.com >

pkgname=kodi-addon-embyrepobeta
pkgver=1.0.6
pkgrel=1
pkgdesc='This repo contains the Kodi Emby addon along with compatible Kodi skins'
_reponame=repository.beta.emby.kodi
arch=('any')
url='https://github.com/MediaBrowser/plugin.video.emby/wiki'
license=('GPL2')
depends=('kodi')
source=("http://kodi.emby.media/repository.beta.emby.kodi-${pkgver}.zip")
sha256sums=('e3d7939c9ccd7918655f2d143113a548620afeb4fffdf134d2aa27144400ae69')
makedepends=('unzip')

prepare() {
  cd $srcdir
}

package() {
  mkdir -p "$pkgdir/usr/share/kodi/addons/"
  cp -r "${srcdir}/${_reponame}" "$pkgdir/usr/share/kodi/addons/"
  find "$pkgdir/usr/share/kodi/addons/${_reponame}" -type f -exec chmod 644 {} \;
}
