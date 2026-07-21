# Maintainer: Joidy App <https://github.com/Axel-DaMage/joidy>
pkgname=joidy
pkgver=1.0.0_rc.2
_tag=1.0.0-rc.2
pkgrel=1
pkgdesc="Personal knowledge management with gamification"
arch=('any')
url="https://joidy-web.vercel.app"
license=('GPL3')
depends=('docker' 'docker-compose')
source=("https://github.com/Axel-DaMage/joidy/archive/v${_tag}.tar.gz")
sha256sums=('d59acadc71d977a2e3621983667affd9b2557b49a6a1cff3e606181c9dd5ce6d')

package() {
  cd "${srcdir}/joidy-${_tag}"
  install -Dm755 bin/joidy "${pkgdir}/usr/bin/joidy"
  install -Dm644 docker-compose.yml "${pkgdir}/usr/share/joidy/docker-compose.yml"
  install -Dm644 .env.example "${pkgdir}/usr/share/joidy/.env.example"
}
