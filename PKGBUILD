# Maintainer: Scott Dickson < scottfoesho@gmail.com >

pkgname=kodi-addon-embyrepobeta
pkgver=1.0.5
pkgrel=1
pkgdesc='This repo contains the Kodi Emby addon along with compatible Kodi skins'
_reponame=repository.beta.emby.kodi
arch=('any')
url='https://github.com/MediaBrowser/plugin.video.emby/wiki/Emby-Repository'
license=('GPL2')
depends=('kodi')
source=("http://kodi.emby.media/repository.beta.emby.kodi-${pkgver}.zip")
sha256sums=('c440c21c11bd8845e2ea44de8a10664f831f41cf3be8d72f0dd36d0d2e2d52da')
makedepends=('unzip')

prepare() {
  cd $srcdir
}

package() {
  mkdir -p "$pkgdir/usr/share/kodi/addons/"
  cp -r "${srcdir}/${_reponame}" "$pkgdir/usr/share/kodi/addons/"
  find "$pkgdir/usr/share/kodi/addons/${_reponame}" -type f -exec chmod 644 {} \;
}
