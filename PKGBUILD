# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Julian Weigt <juw@posteo.de>
pkgname=python-msal
pkgver=1.25.0
pkgrel=1
pkgdesc="Microsoft Authentication Library for Python library to access the Microsoft Cloud by supporting authentication of users with Microsoft Azure Active Directory accounts and Microsoft Accounts using OAuth2 and OpenID Connect"
arch=(any)
url="https://github.com/AzureAD/microsoft-authentication-library-for-python"
license=(MIT)
depends=("python-requests" "python-pyjwt" "python-cryptography" "python-mock")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/AzureAD/microsoft-authentication-library-for-python/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('abe922ceb5783a8078411939bf72ce399de4fe3e607e8ec9b2891901f1fde4c2')

build() {
  cd "microsoft-authentication-library-for-python-$pkgver"
  python setup.py build
}

package() {
  cd "microsoft-authentication-library-for-python-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
