# Maintainer: Sergey Feschukov <snfesh@gmail.com>

pkgname=rhythmbox-plugin-yandex-music
pkgver=0.1
pkgrel=1
pkgdesc='Yandex Music integration for Rhythmbox'
arch=('any')
url='https://github.com/dobroweb/rhythmbox-plugin-yandex-music'
license=('GPL3')
depends=(
    rhythmbox
    python-yandex-music-api
)
makedepends=(
    git
)
conflicts=(
    rhythmbox-plugin-yandex-music-git
)
_commit='822f17ebe810a4a8b1e29f5ad806fc252138cecf'
source=("${pkgname}::git+${url}#commit=${_commit}")
sha256sums=('SKIP')

package() {
  mkdir -p ${pkgdir}/usr/lib/rhythmbox/plugins/yandex-music
  mkdir -p ${pkgdir}/usr/share/rhythmbox/plugins/yandex-music
  cp -R ${srcdir}/rhythmbox-plugin-yandex-music/* ${pkgdir}/usr/lib/rhythmbox/plugins/yandex-music
  cd ${pkgdir}/usr/lib/rhythmbox/plugins/yandex-music/
  mv gschemas.compiled org.gnome.rhythmbox.plugins.yandex-music.gschema.xml yandex-music.svg ${pkgdir}/usr/share/rhythmbox/plugins/yandex-music/
}
