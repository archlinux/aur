# Creator: Tom Vincent <https://tlvince.com/contact>
# Maintainer: Mesmer <https://aur.archlinux.org/account/mesmer>

_pkgname=aws-google-auth
pkgname="python-$_pkgname"
pkgver=0.0.38
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
sha512sums=('bb43bd6718e556595a9277dbfd841b2fb180c307ef41e09dc45e871b1178fb4e97e15ee79938e31729fbe86166e4b60c90976d4e8997e77f19489160f65d0a7c')

build() {
  cd "$srcdir"/$_pkgname-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/$_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
