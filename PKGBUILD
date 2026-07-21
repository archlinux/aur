# Maintainer: Joidy App <https://github.com/Axel-DaMage/joidy>
pkgname=joidy
pkgver=1.0.0_rc.2
_tag=1.0.0-rc.2
pkgrel=2
pkgdesc="Personal knowledge management with gamification"
arch=('any')
url="https://joidy-web.vercel.app"
license=('GPL3')
depends=('docker' 'docker-compose')
source=("https://github.com/Axel-DaMage/joidy/archive/v${_tag}.tar.gz")
sha256sums=('01fda3701ea125e5b628fc8ee1b3d11652073303ced73b3354e0dedf8ae8d92e')

package() {
  cd "${srcdir}/joidy-${_tag}"
  install -Dm755 bin/joidy "${pkgdir}/usr/bin/joidy"
  install -Dm644 docker-compose.yml "${pkgdir}/usr/share/joidy/docker-compose.yml"
  install -Dm644 .env.example "${pkgdir}/usr/share/joidy/.env.example"
}
