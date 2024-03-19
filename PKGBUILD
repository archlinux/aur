# Maintainer: Norbert Preining <norbert@preining.info>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Julian Weigt <juw@posteo.de>
pkgname=python-msal
pkgver=1.28.0
pkgrel=1
pkgdesc="Authenticate with Microsoft Entra (Azure Active Directory) accounts using OAuth2 and OpenID Connect"
arch=(any)
url="https://github.com/AzureAD/microsoft-authentication-library-for-python"
license=(MIT)
depends=("python-requests" "python-pyjwt" "python-cryptography")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/AzureAD/microsoft-authentication-library-for-python/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('9859e942341567a178b00c464641c246dd0fb57300951ae9711546ba5941a55c')

build() {
  cd "microsoft-authentication-library-for-python-$pkgver"
  python setup.py build
}

package() {
  cd "microsoft-authentication-library-for-python-$pkgver"
  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  python setup.py install --root="$pkgdir" --optimize=1
}
