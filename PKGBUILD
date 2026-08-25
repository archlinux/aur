# Maintainer: Ivan Burmin <osguot@vivaldi.net>

pkgname=timeshift-pacman
pkgver=1.0.0
pkgrel=1
pkgdesc='Timeshift snapshots before install, upgrade, and remove pacman transactions'
arch=('any')
url='https://github.com/osguot/timeshift-pacman'
license=('GPL-3.0-only')
depends=('bash' 'coreutils' 'gawk' 'timeshift' 'util-linux')
conflicts=('timeshift-autosnap')
backup=('etc/timeshift-pacman.conf')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('bbd6d17c04fddde86d73108a333ea4e5da6e0204066eb37e04b06c6e363cf51e')

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 usr/bin/timeshift-pacman \
        "$pkgdir/usr/bin/timeshift-pacman"
    install -Dm644 etc/timeshift-pacman.conf \
        "$pkgdir/etc/timeshift-pacman.conf"
    install -Dm644 usr/share/libalpm/hooks/*.hook \
        -t "$pkgdir/usr/share/libalpm/hooks"
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
