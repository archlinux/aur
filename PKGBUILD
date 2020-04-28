# Maintainer: Tom Vincent <http://tlvince.com/contact/>

_pkgname=aws-google-auth
pkgname="python-$_pkgname"
pkgver=0.0.35
pkgrel=1
pkgdesc="Provides AWS STS credentials based on Google Apps SAML SSO auth"
arch=('any')
url="https://github.com/cevoaustralia/aws-google-auth"
license=('MIT')
depends=('python-beautifulsoup4' 'python-boto3' 'python-filelock'
'python-keyring' 'python-lxml' 'python-pillow' 'python-requests' 'python-six'
'python-tabulate' 'python-tzlocal' 'python-keyrings-alt' 'python-configparser')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/cevoaustralia/$_pkgname/archive/$pkgver.tar.gz")
sha512sums=('6c13e416884206e442895117bc78b599596b0ae91bf3300c39df388985bfcef3d33927f98ea02d722aefd6cead8e03ed688abdf45da6a38c7ae0eb0c15ce0854')

build() {
  cd "$srcdir"/$_pkgname-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/$_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
