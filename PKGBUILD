# Maintainer: Sergey Feschukov <snfesh@gmail.com>

pkgname=rhythmbox-plugin-yandex-music
pkgver=0.1
pkgrel=1
_pkgrel=alpha
pkgdesc='Yandex Music integration for Rhythmbox'
arch=('any')
url='https://github.com/dobroweb/rhythmbox-plugin-yandex-music'
license=('GPL3')
depends=(
    rhythmbox
    python-yandex-music-api
)
conflicts=(
    rhythmbox-plugin-yandex-music-git
)
source=("https://github.com/dobroweb/rhythmbox-plugin-yandex-music/archive/refs/tags/${pkgver}-${_pkgrel}.tar.gz")
sha256sums=('713a2e0935ab0583a7e98f4ab807d5e0348df76705a64c9f61e28ed28f79f3e3')

package() {
  mkdir -p ${pkgdir}/usr/lib/rhythmbox/plugins/yandex-music
  mkdir -p ${pkgdir}/usr/share/rhythmbox/plugins/yandex-music
  cp -R ${srcdir}/rhythmbox-plugin-yandex-music-${pkgver}-${_pkgrel}/* ${pkgdir}/usr/lib/rhythmbox/plugins/yandex-music
  cd ${pkgdir}/usr/lib/rhythmbox/plugins/yandex-music/
  mv gschemas.compiled org.gnome.rhythmbox.plugins.yandex-music.gschema.xml yandex-music.svg ${pkgdir}/usr/share/rhythmbox/plugins/yandex-music/
}
