pkgname=nitchrevived-bin
pkgver=0.1.7.5
pkgrel=1
pkgdesc="Incredibly fast system fetch written in nim (binary)"
arch=(x86_64)
url=https://github.com/gnuvalerie/nitchrevived
license=(MIT)
depends=(glibc)
source=("nitchrevived::https://github.com/gnuvalerie/nitchrevived/raw/binary/bin/nitchrevived"
        "LICENSE::https://raw.githubusercontent.com/gnuvalerie/nitchrevived/main/LICENSE")
sha256sums=('SKIP' 'SKIP')

pkgver() {
	curl -sL "https://api.github.com/repos/gnuvalerie/nitchrevived/commits/binary" | grep -m1 '"sha"' | cut -d'"' -f4 | cut -c1-7
}

package() {
	install -Dm755 "$srcdir/nitchrevived" "$pkgdir/usr/bin/nitchrevived"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
