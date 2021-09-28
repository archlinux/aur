# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=docker-prune
pkgver=0.1.0
pkgrel=1
pkgdesc="Remove unused docker data which has not been accessed in last 10 days"
arch=('any')
license=('GPL3')
depends=('docker')
source=("docker-prune.service"
        "docker-prune.timer")
sha256sums=('7e54df7cf6f2f131f0386ea1911e3bbadd67ff691caa542ec8a3fd4a1da8c905'
            'e6bb8c0b0c980c30d7cca1e818c96c0d57f0bd72d219e1bd0af254a561cf8d7a')

package() {
  install -Dm644 docker-prune.service "$pkgdir"/usr/lib/systemd/system/docker-prune.service
  install -Dm644 docker-prune.timer "$pkgdir"/usr/lib/systemd/system/docker-prune.timer
}
