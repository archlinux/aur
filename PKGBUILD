# Maintainer: Thisen Ekanayake <thisenekanayake0330@gmail.com>
pkgname=athena
pkgver=1.0.0
pkgrel=1
pkgdesc="Self-hosted AI research intelligence feed"
arch=('any')
url="https://github.com/Thisen-Ekanayake/Athena"
license=('MIT')
depends=('docker' 'docker-compose')
install=athena.install
source=(
  "docker-compose.yml::https://raw.githubusercontent.com/Thisen-Ekanayake/Athena/main/docker-compose.release.yml"
  ".env.example::https://raw.githubusercontent.com/Thisen-Ekanayake/Athena/main/.env.example"
  "athena"
  "athena.service"
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
  # App directory
  install -dm755 "$pkgdir/opt/athena"
  install -Dm644 docker-compose.yml   "$pkgdir/opt/athena/docker-compose.yml"
  install -Dm644 .env.example         "$pkgdir/opt/athena/.env.example"

  # CLI wrapper
  install -Dm755 athena               "$pkgdir/usr/bin/athena"

  # Systemd service
  install -Dm644 athena.service       "$pkgdir/usr/lib/systemd/system/athena.service"
}
