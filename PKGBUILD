# Contributor: Pieter Lenaerts <pieter dot aj dot lenaerts gmail>

pkgname=python-jpegtran-cffi
pkgver=0.5.2
pkgrel=7
conflicts=('python-jpegtran-cffi-git')
pkgdesc='Fast, (mostly) lossless JPEG transformations with Python'
arch=('any')
url='https://github.com/jbaiter/jpegtran-cffi'
license=('MIT')
source=("https://github.com/jbaiter/jpegtran-cffi/archive/v${pkgver}.tar.gz")
sha256sums=('1d5f10ca9dc86be8ca0ead2745e13b1c9e14f3812ebc4d90926a6836ec7fffc8')
makedepends=('python-setuptools')
depends=('libjpeg-turbo' 'python-cffi')

package() {
  cd "$srcdir"/jpegtran-cffi-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
# vim:set ts=2 sw=2 et:
