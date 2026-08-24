# Maintainer: Joidy App <https://github.com/Axel-DaMage/joidy>
pkgname=joidy
pkgver=1.0.0_beta
_tag=1.0.0-beta
pkgrel=1
pkgdesc="Personal knowledge management with gamification"
arch=('any')
url="https://joidy-web.vercel.app"
license=('GPL3')
depends=('docker')
source=("https://github.com/Axel-DaMage/joidy/archive/v${_tag}.tar.gz")
sha256sums=('6babdf654a2c99a0fc5eaea5f96eb37bede47f85c15dcd6e3d8cd31a9f3155c3')

package() {
  cd "${srcdir}/joidy-${_tag}"
  install -Dm755 scripts/joidy.sh "${pkgdir}/usr/bin/joidy"
  install -Dm644 docker-compose.yml "${pkgdir}/usr/share/joidy/docker-compose.yml"
  install -Dm644 .env.example "${pkgdir}/usr/share/joidy/.env.example"
  install -Dm644 /dev/stdin "${pkgdir}/etc/joidy/path" <<<"/usr/share/joidy"
}
