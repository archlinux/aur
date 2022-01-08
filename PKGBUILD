# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=docker-prune
pkgver=0.2.0
pkgrel=1
pkgdesc="Remove unused docker data which has not been accessed in last 10 days"
arch=('any')
license=('GPL3')
depends=('docker')
source=("docker-prune.service"
        "docker-prune.timer")
sha256sums=('6055ab201b3193d141ca2e30db7c016758921295f38191ed7003e9d7639ede5f'
            'e6bb8c0b0c980c30d7cca1e818c96c0d57f0bd72d219e1bd0af254a561cf8d7a')

package() {
  install -Dm644 docker-prune.service "$pkgdir"/usr/lib/systemd/system/docker-prune.service
  install -Dm644 docker-prune.timer "$pkgdir"/usr/lib/systemd/system/docker-prune.timer
}
