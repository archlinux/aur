# Maintainer: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=flucoma-cli
pkgver=1.0.0.RC1b
pkgrel=1
pkgdesc="Fluid Corpus Manipulation Command line interface"
arch=('x86_64')
url="https://www.flucoma.org/"
license=('BSD')
depends=()
makedepends=()
optdepends=()
provides=("${pkgname}")
conflicts=("flucoma-cli-git")
options=()
_file_name="FluCoMa-CLI-Linux-RC1b.zip"
source=("https://github.com/flucoma/flucoma-cli/releases/download/$pkgver/$_file_name")
md5sums=('20929450867e44e76ad51063d9d6914b')

package() {

	cd "$srcdir/FluidCorpusManipulation"

	# Install binaries
	for F in $(ls bin); do install -Dm755 "bin/$F"  "$pkgdir/usr/bin/$F"; done

	# Install docs
	for F in $(ls docs); do install -Dm755 "docs/$F"  "$pkgdir/usr/share/doc/$pkgname/$F"; done

	install -Dm644 ./LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
