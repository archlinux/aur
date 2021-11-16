# Maintainer: Tom Vincent <https://tlvince.com/contact>

_pkgname=aws-google-auth
pkgname="python-$_pkgname"
pkgver=0.0.37
pkgrel=1
pkgdesc="Provides AWS STS credentials based on Google Apps SAML SSO auth"
arch=('any')
url="https://github.com/cevoaustralia/aws-google-auth"
license=('MIT')
depends=('python-beautifulsoup4' 'python-boto3' 'python-filelock'
'python-keyring' 'python-lxml' 'python-pillow' 'python-requests' 'python-six'
'python-tabulate' 'python-tzlocal' 'python-keyrings-alt' 'python-configparser')
optdepends=('python-u2flib-host: U2F support')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/cevoaustralia/$_pkgname/archive/$pkgver.tar.gz")
sha512sums=('999f792ae023ba623e3c678ead295e59abf8064db4084ed652460f4b9963809bdb954bf391ec99d546df78e4c5f1cbf189c54b123cfd65d941e1f2109f47a92e')

build() {
  cd "$srcdir"/$_pkgname-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/$_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
