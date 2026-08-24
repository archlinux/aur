# Maintainer: Joidy App <https://github.com/Axel-DaMage/joidy>
pkgname=joidy
pkgver=1.0.0_beta.1
_tag=1.0.0-beta.1
pkgrel=1
pkgdesc="Personal knowledge management with gamification"
arch=('any')
url="https://joidy-web.vercel.app"
license=('GPL3')
depends=('docker')
source=("https://github.com/Axel-DaMage/joidy/archive/v${_tag}.tar.gz")
sha256sums=('d69b15d234d7dc245bac425d6056f3a9047b0408a79d514c273b6a6c7a26c62e')

package() {
  cd "${srcdir}/joidy-${_tag}"
  install -Dm755 scripts/joidy.sh "${pkgdir}/usr/bin/joidy"
  install -Dm644 docker-compose.yml "${pkgdir}/usr/share/joidy/docker-compose.yml"
  install -Dm644 .env.example "${pkgdir}/usr/share/joidy/.env.example"
  install -Dm644 /dev/stdin "${pkgdir}/etc/joidy/path" <<<"/usr/share/joidy"
}
