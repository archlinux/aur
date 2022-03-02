# Maintainer: Stick <stick@stma.is>
pkgname=python-cleantoots
_name=${pkgname#python-}
pkgver=0.7.0
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
sha256sums=('24f2f2e5e0c4c4383f8088c84b5de6933110b4a4e31dfea0226bb7ac8ec3ea8e')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
