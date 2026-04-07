# Maintainer: Raphael Bitton <raphael@rbitton.com>
pkgname=zfstop
_reponame=ztop
pkgver=0.1.0
pkgrel=1
pkgdesc="A terminal dashboard for ZFS, in the spirit of htop"
arch=('x86_64')
url="https://git.skylantix.com/rbitton/ztop"
license=('MIT')
depends=()
provides=('ztop')
keywords=('zfs' 'ztop')
source=("ztop-linux-amd64::https://git.skylantix.com/rbitton/ztop/-/jobs/artifacts/v${pkgver}/raw/ztop-linux-amd64?job=build"
        "LICENCE::https://git.skylantix.com/rbitton/ztop/-/raw/v${pkgver}/LICENCE")
sha256sums=('SKIP' 'SKIP')

package() {
    install -Dm755 ztop-linux-amd64 "$pkgdir/usr/bin/ztop"
    ln -s ztop "$pkgdir/usr/bin/zfstop"
    install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
}
