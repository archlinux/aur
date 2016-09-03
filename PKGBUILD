# Maintainer: Gaël Donval <gdonval+aur at google mail>
# Contributor: Gaël Donval <gdonval+aur at google mail>

pkgbase='python-odo'
pkgname='python-odo'
pkgver=0.5.0
pkgrel=1
pkgdesc='Data migration library for Python (csv, hdf5, SQL, etc.)'
arch=('any')
url='https://github.com/blaze/odo/'
license=('BSD')
makedepends=('python-setuptools')
groups=('blaze-ecosystem')
depends=('python-datashape>=0.5.0'
         'python>=3.4'
         'python-numpy>=1.7'
         'python-pandas>=0.15.0'
         'python-toolz>=0.7.3'
         'python-multipledispatch>=0.4.7'
         'python-networkx')
source=("https://github.com/blaze/odo/archive/${pkgver}.tar.gz")
md5sums=('aadddca014124a37730e8b2924fc41d6')
sha1sums=('f4d1b39a5b0852e0c990b53c873f24c7d2307cf6')

build() {
  cd "${srcdir}"/odo-$pkgver
  python setup.py build
}

package_python-odo() {
  cd "${srcdir}"/odo-$pkgver
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE* "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 README* "${pkgdir}/usr/share/doc/${pkgname}/README"
}
