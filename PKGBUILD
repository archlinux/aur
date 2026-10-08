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
)
sha256sums=(
    'f13497749c2809b048c994a7529843686a7ee7aba01a91f20a1b1a49852f978b'
    'e216d4395321c9341a9a7dcc3fd1a4e9b33ade519ceb31f0f89037fd9d409c23'
    '77e552978ce9f95b1c2bcfed891fb0300ec9136d167cb07496e910b49f000efd'
)

package() {
    install -Dm755 "$srcdir/update-repo-mirrors" \
        "$pkgdir/usr/bin/update-repo-mirrors"

    install -Dm644 "$srcdir/repo-mirrors@.service" \
        "$pkgdir/usr/lib/systemd/system/repo-mirrors@.service"

    install -Dm644 "$srcdir/repo-mirrors@.timer" \
        "$pkgdir/usr/lib/systemd/system/repo-mirrors@.timer"
}
