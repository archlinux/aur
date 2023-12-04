# Maintainer: ccat3z <c0ldcat3z@gmail.com>

pkgver=1.32
pkgname=(hledger-bin hledger-ui-bin hledger-web-bin)
pkgrel=1
pkgdesc="Easy-to-use command-line/curses/web plaintext accounting tool"
arch=(x86_64)
url="http://hledger.org"
license=('GPL')
depends=('gmp' 'ncurses5-compat-libs')
makedepends=('coreutils')
source=(
    hledger-${pkgver}.zip::https://github.com/simonmichael/hledger/releases/download/${pkgver}/hledger-linux-x64.zip
)
sha256sums=(
    a1283804d5a3cf1e5dd898605bde3868fbabcbef45145ed7844034995cf7f80d
)

prepare() {
    cd $srcdir
    tar -xvf ./hledger-linux-x64.tar
}

package_hledger-bin() {
    pkgdesc="Command-line interface for the hledger accounting system"
	provides=(hledger)
	conflicts=(hledger)
    depends+=(glibc)

    install -Dm 755 ./hledger "$pkgdir/usr/bin/hledger"
}

package_hledger-ui-bin() {
    pkgdesc="Curses-style terminal interface for the hledger accounting system"
	provides=(hledger-ui)
	conflicts=(hledger-ui)
    depends+=(zlib)

    install -Dm 755 ./hledger-ui "$pkgdir/usr/bin/hledger-ui"
}

package_hledger-web-bin() {
    pkgdesc="Web-based user interface for the hledger accounting system"
	provides=(hledger-web)
	conflicts=(hledger-web)
    depends+=(zlib)

    install -Dm 755 ./hledger-web "$pkgdir/usr/bin/hledger-web"
}
