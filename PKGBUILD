# Maintainer: Oliver Rümpelein <arch@pheerai>

pkgname=python-bitwarden-keyring
_pkgname=bitwarden-keyring
pkgver=0.3.1
pkgrel=1
pkgdesc="Bitwarden-CLI as keyring provider"
arch=('any')
url="https://github.com/ewjoachim/bitwarden-keyring/"
license=('MIT')
depends=('python' 'bitwarden-cli' 'python-keyring')
source=("${_pkgname}-${pkgver}::https://github.com/ewjoachim/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('4b56e9201b6b31121d5b12cce1b5f1c0d6aa2731d5c885fd7088fd57d9407feedd3e40c546c379465c953cf3103f332fb0916f0a8622ab657ffa331f112b58bf')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
