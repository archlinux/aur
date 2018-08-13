# Maintainer: Gaël Donval <gdonval+aur at google mail>
# Contributor: Gaël Donval <gdonval+aur at google mail>

pkgbase='python-datashape'
pkgname=('python-datashape')
pkgver=0.5.3
pkgrel=2
pkgdesc='Data description protocol for dynd similar to Numpy DTypes.'
arch=('any')
url='https://github.com/blaze/datashape'
license=('BSD')
groups=('blaze-ecosystem')
makedepends=('python-setuptools')
depends=('python-numpy>=1.7'
         'python>=3.4'
         'python-multipledispatch>=0.4.7'
         'python-dateutil')
source=("https://github.com/blaze/datashape/archive/${pkgver}.tar.gz")
sha1sums=('e79b5eb684a698509cf8d46138fa717fa6826e2a')
md5sums=('e243704f530ef7520ad9d5a70d337683')

build() {
  cd "${srcdir}"/datashape-$pkgver
  python setup.py build
}

package_python-datashape() {
  cd "${srcdir}"/datashape-$pkgver
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE* "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 README* "${pkgdir}/usr/share/doc/${pkgname}/README"
}
