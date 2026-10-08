# Maintainer: yagopop42@gmail.com

pkgname=rate-mirrors-repo-updater
pkgver=1.0.0
pkgrel=1
pkgdesc='Periodic mirror ranking for Arch Linux CN and Chaotic-AUR using rate-mirrors'
arch=('any')
url='https://github.com/6h4n3m/rate-mirrors'
license=('MIT')
depends=('bash' 'coreutils' 'rate-mirrors' 'systemd')
install=rate-mirrors-repo-updater.install
source=(
    'update-repo-mirrors'
    'repo-mirrors@.service'
    'repo-mirrors@.timer'
    'rate-mirrors-repo-updater.install'
)
sha256sums=(
    '8c015d9348f87b2cb6c95c606e1dcc5af0d5b5ca802ce035edb1f985aa9cf9df'
    'e216d4395321c9341a9a7dcc3fd1a4e9b33ade519ceb31f0f89037fd9d409c23'
    '77e552978ce9f95b1c2bcfed891fb0300ec9136d167cb07496e910b49f000efd'
    'd51b09bdd59b6c8b8d483dcde128194fe17c38b5f3bea8c9a9ee972265e38de6'
)

package() {
    install -Dm755 "$srcdir/update-repo-mirrors" \
        "$pkgdir/usr/bin/update-repo-mirrors"

    install -Dm644 "$srcdir/repo-mirrors@.service" \
        "$pkgdir/usr/lib/systemd/system/repo-mirrors@.service"

    install -Dm644 "$srcdir/repo-mirrors@.timer" \
        "$pkgdir/usr/lib/systemd/system/repo-mirrors@.timer"
}
