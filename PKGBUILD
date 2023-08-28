# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: Scott Dickson < scottfoesho@gmail.com >

pkgname=kodi-addon-embyrepo
pkgver=1.0.7
pkgrel=1
pkgdesc='This repo contains the Kodi Emby addon along with compatible Kodi skins'
_reponame=repository.emby.kodi
arch=('any')
url='https://github.com/MediaBrowser/plugin.video.emby/wiki/Emby-Repository'
license=('GPL2')
makedepends=('unzip')
depends=('kodi')
source=("http://kodi.emby.media/repository.emby.kodi-${pkgver}.zip")
sha256sums=('0b090bd9fd7a1ffddc0a4684cbb24846bc75d5925a0bce2767af68300c3a0e53')

package() {
  mkdir -p "$pkgdir/usr/share/kodi/addons/"
  cp -r "${srcdir}/${_reponame}" "$pkgdir/usr/share/kodi/addons/"
  find "$pkgdir/usr/share/kodi/addons/${_reponame}" -type f -exec chmod 644 {} \;
}
