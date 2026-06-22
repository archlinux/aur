# Maintainer: graysky <therealgraysky AT proton DOT me>
pkgname=comchap
pkgver=0.0.1.r90.gdd7db30
pkgrel=1
_commit=dd7db30c258e965f282ac78825971dd0703a031e
pkgdesc="Detect commercials with Comskip and add chapter marks (comchap) or cut them (comcut)"
arch=('any')
url="https://github.com/BrettSheleski/comchap"
license=('MIT')
depends=('bash' 'ffmpeg')
optdepends=('comskip: commercial detection when no .edl file is present')
source=("$pkgname-$_commit.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('d3b5d07c59ac8a77a6532107bf58f0e2cac4856b87cfe20c6ba3e0c306d52930')

package() {
	cd "$srcdir/$pkgname-$_commit"

	install -Dm755 comchap "$pkgdir/usr/bin/comchap"
	install -Dm755 comcut  "$pkgdir/usr/bin/comcut"

	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"

	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 usage.txt "$pkgdir/usr/share/doc/$pkgname/usage.txt"
}
