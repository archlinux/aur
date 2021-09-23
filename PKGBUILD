# Maintainer: ccat3z <c0ldcat3z@gmail.com>

pkgver=1.23
pkgname=(hledger-bin hledger-ui-bin hledger-web-bin)
pkgrel=1
pkgdesc="Easy-to-use command-line/curses/web plaintext accounting tool"
arch=(x86_64)
url="http://hledger.org"
license=('GPL')
depends=('gmp' 'ncurses5-compat-libs')
makedepends=('coreutils')
source=(
    hledger-${pkgver}.zip::https://github.com/simonmichael/hledger/releases/download/${pkgver}/hledger-linux-static-x64.zip
)
sha256sums=(
    7c44a3b2bce8b3c7747c8aa8e58e0638c11dc479a80b8de6f962484a0517655c
)

package_hledger-bin() {
    pkgdesc="Command-line interface for the hledger accounting system"
	provides=(hledger)
	conflicts=(hledger)
    depends+=(glibc)

    install -Dm 755 ./hledger-linux-static-x64 "$pkgdir/usr/bin/hledger"
}

package_hledger-ui-bin() {
    pkgdesc="Curses-style terminal interface for the hledger accounting system"
	provides=(hledger-ui)
	conflicts=(hledger-ui)
    depends+=(zlib)

    install -Dm 755 ./hledger-ui-linux-static-x64 "$pkgdir/usr/bin/hledger-ui"
}

package_hledger-web-bin() {
    pkgdesc="Web-based user interface for the hledger accounting system"
	provides=(hledger-web)
	conflicts=(hledger-web)
    depends+=(zlib)

    install -Dm 755 ./hledger-web-linux-static-x64 "$pkgdir/usr/bin/hledger-web"
}
