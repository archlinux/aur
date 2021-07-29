# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-certauth
_name=${pkgname#python-}
pkgver=1.3.0
pkgrel=1
pkgdesc="Simple Certificate Authority for MITM proxies"
url="https://gitlab.com/ikreymer/certauth"
depends=(
    'python'
    'python-pyopenssl'
    'python-tldextract'
)
makedepends=('python-setuptools')
license=('GPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('7862d5deff0b33d2fb28d36861ba63d91c82d700bfdfc4bd848a8711ca72b8fb')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
