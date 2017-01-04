# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
pkgname=pyglossary
pkgver=3.0.4
pkgrel=2
pkgdesc="A tool for converting dictionary files aka glossaries with various formats for different dictionary applications"
arch=(any)
url="https://github.com/ilius/pyglossary"
license=('GPL3')
depends=('python')
provides=("${pkgname}=${pkgver}")
conflicts=(${pkgname}-git)
source=("https://github.com/ilius/${pkgname}/archive/${pkgver}.tar.gz"
        "setup.patch")
sha256sums=('be0c88987ca4791a858271a7c9acdbd6a680e4fdc61ddc6ad2d06b090a1bdc6e'
            '815f447495e0e2450708a6a3b0fcea04adf079ca47e51a2cfedc70921100cedf')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np0 < ../setup.patch
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}

# vim:set ts=2 sw=2 et:
