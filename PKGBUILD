# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-autopep8
_pkgname=autopep8
pkgver=1.4.4
pkgrel=1
pkgdesc="A tool that automatically formats Python code to conform to the PEP 8 style guide."
arch=('any')
url=https://github.com/hhatto/autopep8
license=('MIT')
depends=('python' 'python-pycodestyle')
makedepends=('python-setuptools')
source=("https://github.com/hhatto/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('7ec12f04caaf357ec4d19a832c2f65434cc1cc2d12db6eb7d6d5131565f45754')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}


package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
