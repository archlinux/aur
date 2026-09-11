# Maintainer: Joidy App <https://github.com/Axel-DaMage/joidy>
pkgname=joidy
pkgver=1.1.0_beta.2
_tag=1.1.0-beta.2
pkgrel=1
pkgdesc="Personal knowledge management with gamification"
arch=('any')
url="https://joidy-web.vercel.app"
license=('GPL3')
depends=('docker')
source=("https://github.com/Axel-DaMage/joidy/archive/v${_tag}.tar.gz")
sha256sums=('8c3690cd3b9530a1ce45057c4f825a2517870de2404edc9566ebdb16ba03dbea')

package() {
  cd "${srcdir}/joidy-${_tag}"
  install -Dm755 scripts/joidy.sh "${pkgdir}/usr/bin/joidy"
  install -Dm644 docker-compose.yml "${pkgdir}/usr/share/joidy/docker-compose.yml"
  install -Dm644 .env.example "${pkgdir}/usr/share/joidy/.env.example"
  install -Dm644 /dev/stdin "${pkgdir}/etc/joidy/path" <<<"/usr/share/joidy"
}
