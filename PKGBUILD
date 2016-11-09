# Maintainer: Gaël Donval <gdonval+aur at google mail>
# Contributor: Gaël Donval <gdonval+aur at google mail>

pkgbase='python-flask-cors'
pkgname=('python-flask-cors')
pkgver=3.0.2
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
sha1sums=('8cc34fe29cfba4d9cc82be608c224e1206898ab9')
md5sums=('4128bfd92929beca457fd1fb5a2c7812')

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
