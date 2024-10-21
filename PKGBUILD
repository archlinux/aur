pkgname=python-flask-misaka
_name=${pkgname#python-}
_cname='Flask-Misaka'
pkgver=1.0.1
pkgrel=1
pkgdesc='Misaka bindings for Flask'
url='https://github.com/singingwolfboy/flask-misaka'
license=('MIT')
arch=('any')
depends=('python' 'python-flask' 'python-misaka<3.0.0' 'python-markupsafe')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_cname}-${pkgver}.tar.gz")

build() {
  cd "$srcdir/${_cname}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${_cname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums=('5dc58780b79666c107bdd301764b658d56a97a22af06e716b281d641a98a29fa')
