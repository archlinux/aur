# Maintainer: Brent Carmer <bcarmer@gmail.com>
pkgname=cryptol
pkgver=2.4.0
pkgrel=1
pkgdesc="A domain-specific language for specifying cryptographic algorithms."
url="http://www.cryptol.net"
arch=('x86_64' 'i686')
license=('BSD')
depends=('gmp4' 'ncurses5-compat-libs' 'z3')
makedepends=()
conflicts=()
replaces=()
backup=()

if test "$CARCH" == x86_64; then
    _MYARCH=64
    sha512sums=('20c676b96306981a2babc3377992916cbf9ed4adbdc0b80613d09b30ae1d124958da1670d26238ae815222713395c10a9d9410aa0bd05323e59bfab602863cdc')
else
    _MYARCH=32
    sha512sums=('2e23c3e07ebd3e765ed3e629103cef7077e6048ae01f5538d120ab7148aac44485b2ec9728fc63171f0b18cddda564ad078a20e57772eeffa8af1238ea501b54')
fi

source=("https://github.com/GaloisInc/cryptol/releases/download/$pkgver/cryptol-${pkgver}-CentOS6-$_MYARCH.tar.gz")

package() {
    cd "$srcdir/cryptol-${pkgver}-CentOS6-${_MYARCH}"
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/cryptol"
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
    cp bin/cryptol "$pkgdir/usr/bin"
    cp -r share/cryptol/* "$pkgdir/usr/share/cryptol"
    cp share/doc/cryptol/LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
}
