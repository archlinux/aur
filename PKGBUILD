# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Robert Kubosz <kubosz.robert@gmail.com>

pkgname=python-abjad-ext-ipython
_name="${pkgname#python-}"
pkgver=3.3
pkgrel=2
pkgdesc='Abjad IPython extension'
arch=('any')
url="https://github.com/abjad/abjad-ext-ipython"
license=('MIT')
groups=('abjad')
depends=(
	"python-abjad=$pkgver"
	'jupyter>=1.0.0')
makedepends=('python-setuptools' 'git')
source=("$pkgname-$pkgver::git+$url#tag=v$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('EF80D3D6F5926FC997919D6A27A5BE0A6ADE7F36')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
