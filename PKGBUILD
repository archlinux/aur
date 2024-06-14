# Maintainer: Daniel Kuehn <daniel@kuehn.foo>
pkgname=wordgen-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="A CLI program that prints random words generated from the EFF Large Wordlist."
arch=('x86_64')
url="https://github.com/wordgen/cli"
license=('AGPL-3.0-or-later')
conflicts=('wordgen')
provides=('wordgen')
options=(!strip !debug)
source=("$url/releases/download/v$pkgver/wordgen-linux-amd64"
        "$url/releases/download/v$pkgver/LICENSE")
sha256sums=('5af1fe4483d8f564abc67081be1b48e6c6e3c6e261aa8c1cf025ef1309e86f57'
            '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0')

package() {
	cd "$srcdir"

	install -Dm755 "wordgen-linux-amd64" "$pkgdir/usr/bin/wordgen"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/wordgen/LICENSE"
}
