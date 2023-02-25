# Maintainer: Sergey Feschukov <snfesh@yandex.ru>

pkgname=rhythmbox-plugin-yandex-music
pkgver=0.5
pkgrel=1
_pkgrel=alpha
pkgdesc='Yandex Music integration for Rhythmbox'
arch=('any')
url='https://github.com/feschukov/rhythmbox-plugin-yandex-music'
license=('GPL3')
depends=(
    rhythmbox
    python-yandex-music-api
)
conflicts=(
    rhythmbox-plugin-yandex-music-git
)
source=("https://github.com/feschukov/rhythmbox-plugin-yandex-music/archive/refs/tags/${pkgver}-${_pkgrel}.tar.gz")
sha256sums=('8c84539fac3a0137eac70d75bd836353e4a908faf6a91c36cef8f8bfc8c9a67d')

package() {
  mkdir -p ${pkgdir}/usr/lib/rhythmbox/plugins/yandex-music
  mkdir -p ${pkgdir}/usr/share/rhythmbox/plugins/yandex-music
  cp -R ${srcdir}/rhythmbox-plugin-yandex-music-${pkgver}-${_pkgrel}/* ${pkgdir}/usr/lib/rhythmbox/plugins/yandex-music
  cd ${pkgdir}/usr/lib/rhythmbox/plugins/yandex-music/
  mv gschemas.compiled org.gnome.rhythmbox.plugins.yandex-music.gschema.xml yandex-music.svg ${pkgdir}/usr/share/rhythmbox/plugins/yandex-music/
}
