# Maintainer: Cem Aydin <cem.aydin@gmx.ch>
# Contributor: Cem Aydin <cem.aydin@gmx.ch>

pkgbase='python-flask-jwt-extended'
pkgname=('python-flask-jwt-extended')
pkgver=3.12.1
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
sha1sums=('f9298bce5c0cc63536569d8c6685b91e6ca087e2')
md5sums=('722d1ddf9a88f68c5d4639ef0c0caeef')

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
