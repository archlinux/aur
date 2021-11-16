# Creator: Tom Vincent <https://tlvince.com/contact>
# Maintainer: Mesmer <https://aur.archlinux.org/account/mesmer>

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
sha512sums=('d128857ab1b6eaec28c69b488c8efd52a036a36c23dc2f8f12e8269d2ce891a3024b58f581e1867341495f079d9b7fb9a48ee91c47284639b2917079a8f4747a')

build() {
  cd "$srcdir"/$_pkgname-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/$_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
