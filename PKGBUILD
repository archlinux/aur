# Maintainer: Gaël Donval <gdonval+aur at google mail>
# Contributor: Gaël Donval <gdonval+aur at google mail>

pkgbase='python-flask-cors'
pkgname=('python-flask-cors')
pkgver=3.0.0
pkgrel=1
pkgdesc='cross origin resource sharing (CORS) support for Flask'
arch=('any')
url='https://github.com/corydolphin/flask-cors'
license=('BSD')
makedepends=('python-setuptools')
depends=('python-flask>=0.9'
         'python-six'
         'python>=3.4')
source=("https://github.com/corydolphin/flask-cors/archive/${pkgver}.tar.gz")
sha1sums=('1ec308411b73d0d7af2503a862982e740b0d4aa4')
md5sums=('2494a101dac16a43ad4bc36368f0ecdf')

build() {
  cd "${srcdir}"/flask-cors-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}"/flask-cors-$pkgver
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}
