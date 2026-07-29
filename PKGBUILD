pkgname=archclone
pkgver=1.0.4
pkgrel=1
pkgdesc="Plugin-based backup and restore framework for Arch Linux"
arch=('any')
url="https://github.com/a4ace1/ArchClone"
license=('MIT')
depends=('bash' 'rsync' 'tar' 'coreutils' 'findutils' 'grep' 'sed')
source=("$pkgname-$pkgver.tar.gz::https://github.com/a4ace1/ArchClone/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/ArchClone-$pkgver"

    install -Dm755 archclone "$pkgdir/usr/bin/archclone"

    install -d "$pkgdir/usr/lib/archclone"

    cp -r \
        backup.sh \
        doctor.sh \
        restore.sh \
        verify.sh \
        lib \
        modules \
        restore \
        config \
        VERSION \
        "$pkgdir/usr/lib/archclone"

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
