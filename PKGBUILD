# Maintainer: Joidy App <https://github.com/Axel-DaMage/joidy>
pkgname=joidy
pkgver=1.0.0-beta.4
_tag=${pkgver}
pkgrel=1
pkgdesc="Personal knowledge management with gamification"
arch=('any')
url="https://joidy-web.vercel.app"
license=('GPL3')
depends=('docker')
install=joidy.install
source=("https://github.com/Axel-DaMage/joidy/archive/v${_tag}.tar.gz"
        "joidy.install")
sha256sums=('SKIP' 'SKIP')

package() {
  cd "${srcdir}/joidy-${_tag}"
  install -Dm755 scripts/joidy.sh "${pkgdir}/usr/bin/joidy"
  install -Dm644 docker-compose.yml "${pkgdir}/usr/share/joidy/docker-compose.yml"
  install -Dm644 .env.example "${pkgdir}/usr/share/joidy/.env.example"
  install -Dm644 /dev/stdin "${pkgdir}/etc/joidy/path" <<<"/usr/share/joidy"
}
