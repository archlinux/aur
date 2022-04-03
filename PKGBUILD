# Maintainer: Sergey Feschukov <snfesh@gmail.com>

pkgname=rhythmbox-plugin-yandex-music
pkgver=0.2
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
sha256sums=('25d804579ceef0157767cb2657a88355b697ef2406737d5e0d4db5aeb7cbc75f')

package() {
  mkdir -p ${pkgdir}/usr/lib/rhythmbox/plugins/yandex-music
  mkdir -p ${pkgdir}/usr/share/rhythmbox/plugins/yandex-music
  cp -R ${srcdir}/rhythmbox-plugin-yandex-music-${pkgver}-${_pkgrel}/* ${pkgdir}/usr/lib/rhythmbox/plugins/yandex-music
  cd ${pkgdir}/usr/lib/rhythmbox/plugins/yandex-music/
  mv gschemas.compiled org.gnome.rhythmbox.plugins.yandex-music.gschema.xml yandex-music.svg ${pkgdir}/usr/share/rhythmbox/plugins/yandex-music/
}
