# Maintainer: Raphael Bitton <raphael@skylantix.com>
pkgname=zfstop
_reponame=ztop
pkgver=0.1.3
pkgrel=1
pkgdesc="A terminal dashboard for ZFS, in the spirit of htop"
arch=('x86_64')
url="https://git.skylantix.com/rbitton/ztop"
license=('MIT')
depends=()
provides=('ztop')
keywords=('zfs' 'ztop')
source=("ztop-linux-amd64::https://git.skylantix.com/api/v4/projects/rbitton%2Fztop/packages/generic/ztop/${pkgver}/ztop-linux-amd64"
        "LICENCE::https://git.skylantix.com/rbitton/ztop/-/raw/v${pkgver}/LICENCE")
sha256sums=('4ea916ec3903e4e606d36e768271c221e241885ea519e733e487d78a12e1bb10' 'c01aff442f364e4af49f96e1233a02585f815895eb03aaec45b3a1e97b824cd4')

package() {
    install -Dm755 ztop-linux-amd64 "$pkgdir/usr/bin/ztop"
    ln -s ztop "$pkgdir/usr/bin/zfstop"
    install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
}
