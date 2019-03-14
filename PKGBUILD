# Maintainer: Cem Aydin <cem.aydin@gmx.ch>
# Contributor: Cem Aydin <cem.aydin@gmx.ch>

pkgbase='python-flask-jwt-extended'
pkgname=('python-flask-jwt-extended')
pkgver=3.18.0
pkgrel=1
pkgdesc='Extended JSON Web Tokens (JWT) support for Flask'
arch=('any')
url='https://github.com/vimalloc/flask-jwt-extended'
license=('MIT')
makedepends=('python-setuptools')
depends=('python'
         'python-asn1crypto'
         'python-babel'
         'python-certifi'
         'python-cffi'
         'python-chardet'
         'python-click'
         'python-cryptography'
         'python-docutils'
         'python-flask'
         'python-idna'
         'python-imagesize'
         'python-itsdangerous'
         'python-jinja'
         'python-markupsafe'
         'python-packaging'
         'python-pluggy'
         'python-py'
         'python-pycparser'
         'python-pygments'
         'python-pyjwt'
         'python-pyparsing'
         'python-pytz'
         'python-requests'
         'python-six'
         'python-snowballstemmer'
         'python-sphinx'
         'python-sphinx-alabaster-theme'
         'python-sphinxcontrib-websupport'
         'python-tox'
         'python-urllib3'
         'python-virtualenv'
         'python-werkzeug'
)
source=("https://github.com/vimalloc/flask-jwt-extended/archive/${pkgver}.tar.gz")
sha1sums=('18f2991d9ee1d7ac6ecbc4a1cb08f52e424b59ed')
md5sums=('7e2f690f076193d290844186856736af')

build() {
  cd "${srcdir}"/flask-jwt-extended-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}"/flask-jwt-extended-$pkgver
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
