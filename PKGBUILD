# Maintainer: Stick <stick@stma.is>
pkgname=python-cleantoots
_name=${pkgname#python-}
pkgver=0.4.1
pkgrel=1
pkgdesc="Cleanup your toot history"
arch=('any')
url="https://gabnotes.org/cleantoots-clean-your-toot-history/"
license=('GPL')
depends=(
	'python-mastodon'
	'python-click'
	'python-html2text'
	'python-pendulum'
)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('450898a58b905a10a37e8fdf3ce2d825f43baa74e8e516f61362e0f99a2767b6')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
