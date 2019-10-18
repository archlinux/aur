# Maintainer: WhizSid <whizsid@aol.com>
pkgname=osm-to-sql
pkgver=0.1.2
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="A tool to convert open street map XML data to SQL files."
url="https://github.com/whizsid/osm-to-sql"
license=('MIT')
source=('osm-to-sql::git+https://github.com/whizsid/osm-to-sql#tag=0.1.2')
md5sums=('SKIP')

build() {
    cd $pkgname
    cargo build --release --locked
}

package() {
    install -Dm 755 "$srcdir/$pkgname/target/release/${pkgname}" -t "${pkgdir}/usr/bin"
}
