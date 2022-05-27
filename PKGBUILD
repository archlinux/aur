# Maintainer: Sergey Feschukov <snfesh@yandex.ru>

pkgname=rhythmbox-plugin-yandex-music
pkgver=0.3
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
sha256sums=('ccfab00c41d455b27d48a0259e55146e4a3027d404d0cdbbca00425805cbee26')

package() {
  mkdir -p ${pkgdir}/usr/lib/rhythmbox/plugins/yandex-music
  mkdir -p ${pkgdir}/usr/share/rhythmbox/plugins/yandex-music
  cp -R ${srcdir}/rhythmbox-plugin-yandex-music-${pkgver}-${_pkgrel}/* ${pkgdir}/usr/lib/rhythmbox/plugins/yandex-music
  cd ${pkgdir}/usr/lib/rhythmbox/plugins/yandex-music/
  mv gschemas.compiled org.gnome.rhythmbox.plugins.yandex-music.gschema.xml yandex-music.svg ${pkgdir}/usr/share/rhythmbox/plugins/yandex-music/
}
