# Maintainer: BowDown097 <bowdown097 at sneed dot church>

pkgname=nordvpn-dinit
pkgver=20230907
pkgrel=1
pkgdesc="dinit service script for nordvpn-bin"
arch=('any')
url="https://nordvpn.com/download/linux/"
license=('GPL3')
depends=('dinit' 'nordvpn-bin' 'shadow')
source=('nordvpnd' 'nordvpnd.script')
sha256sums=('8f4ccc0d5881edbc25d0f6eb01fe874c56adaac577e859c192706c5932e77357'
            '5c432d60d47f5572ccc8e43507059f6dd56eeda8b2f148ef044fbfb8b4af5757')

package() {
    install -dm755 "$pkgdir/etc/dinit.d"
    install -Dm755 "$srcdir/nordvpnd" "$pkgdir/etc/dinit.d"
    install -Dm755 "$srcdir/nordvpnd.script" "$pkgdir/etc/dinit.d/scripts/nordvpnd"
}
