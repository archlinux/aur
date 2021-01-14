# Maintainer: Wouter Wijsman <wwijsman@live.nl>

pkgname=minigalaxy
pkgver=1.0.2
pkgrel=1
pkgdesc="A simple GOG client for Linux"
arch=('any')
url="https://github.com/sharkwouter/minigalaxy"
license=('GPL-3')
source=(https://github.com/sharkwouter/minigalaxy/archive/"$pkgver".tar.gz)
md5sums=('4820ef83640f4206e43760757e76b647')
depends=('python' 'python-requests' 'python-gobject' 'gtk3' 'webkit2gtk')
optdepends=('scummvm' 'dosbox' 'wine')
makedepends=('python' 'python-setuptools')

build() {
        cd "$srcdir/$pkgname-$pkgver"
        python setup.py build
}
package() {
	cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --prefix=/usr --skip-build
	install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -D -m 644 THIRD-PARTY-LICENSES.md "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-LICENSES.md"
	install -D -m 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -D -m 644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
