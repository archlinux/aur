# Maintainer: Oliver Rümpelein <arch@pheerai>

pkgname=python-bitwarden-keyring
_pkgname=bitwarden-keyring
pkgver=0.3.0
pkgrel=1
pkgdesc="Bitwarden-CLI as keyring provider"
arch=('any')
url="https://github.com/ewjoachim/bitwarden-keyring/"
license=('MIT')
depends=('python' 'bitwarden-cli' 'python-keyring')
source=("${_pkgname}-${pkgver}::https://github.com/ewjoachim/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('afe23c77d5315f4d29230d4c987f6e6f622b64050640995dc7c140e670b4c1138274e932eebbbd85d6d24ac9a5e0c5df8eac85e8980e8a37430a425511354ff2')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
