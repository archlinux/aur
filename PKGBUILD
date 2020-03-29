# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: Scott Dickson < scottfoesho@gmail.com >

pkgname=kodi-addon-embyrepo
pkgver=1.0.6
pkgrel=1
pkgdesc='This repo contains the Kodi Emby addon along with compatible Kodi skins'
_reponame=repository.emby.kodi
arch=('any')
url='https://github.com/MediaBrowser/plugin.video.emby/wiki/Emby-Repository'
license=('GPL2')
makedepends=('unzip')
depends=('kodi')
source=("http://kodi.emby.media/repository.emby.kodi-${pkgver}.zip")
sha256sums=('aaa48aafa31e14b7b5f415400174a2566603c0d261c7cb122d363521490d032a')

package() {
  mkdir -p "$pkgdir/usr/share/kodi/addons/"
  cp -r "${srcdir}/${_reponame}" "$pkgdir/usr/share/kodi/addons/"
  find "$pkgdir/usr/share/kodi/addons/${_reponame}" -type f -exec chmod 644 {} \;
}
