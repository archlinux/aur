# Maintainer: Norbert Preining <norbert@preining.info>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Julian Weigt <juw@posteo.de>
pkgname=python-msal
pkgver=1.30.0
pkgrel=1
pkgdesc="Authenticate with Microsoft Entra (Azure Active Directory) accounts using OAuth2 and OpenID Connect"
arch=(any)
url="https://github.com/AzureAD/microsoft-authentication-library-for-python"
license=(MIT)
depends=("python-requests" "python-pyjwt" "python-cryptography")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/AzureAD/microsoft-authentication-library-for-python/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a7afb03af2da5bdbb7cb3640cfb6191c9dab9edc6889db735a5fe3fda18dc2b9')

build() {
  cd "microsoft-authentication-library-for-python-$pkgver"
  python setup.py build
}

package() {
  cd "microsoft-authentication-library-for-python-$pkgver"
  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  python setup.py install --root="$pkgdir" --optimize=1
}
