# Maintainer: Drew DeVault <sir@cmpwn.com>

pkgname='python-flask-markdown'
pkgver=0.3
pkgrel=1
pkgdesc='Adds markdown support to your Flask application'
arch=('any')
url='https://pypi.python.org/pypi/Flask-Markdown/0.3'
license=('BSD')
depends=('python-flask')
makedepends=('python-distribute')
source=("http://pypi.python.org/packages/source/F/Flask-Markdown/Flask-Markdown-${pkgver}.tar.gz")
md5sums=('37bf5cf3171adb8ba8d2235cb4ef049f')

build() {

  cd "${srcdir}/Flask-Markdown-${pkgver}"
  python ./setup.py build

}

package() {

  cd "${srcdir}/Flask-Markdown-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
