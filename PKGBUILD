# Maintainer: enihcam <nanericwang at the google email domain which is .com>
# Contributor: Arun <cute.tec at the google email domain which is .com>

pkgname=walinuxagent
_pkgname=WALinuxAgent
pkgver=2.2.25
pkgrel=1
pkgdesc="Microsoft Azure Linux Guest Agent"
arch=('any')
url="https://github.com/Azure/WALinuxAgent"
license=('Apache')
depends=('python' 'openssh' 'openssl' 'parted' 'net-tools')
makedepends=('python-setuptools')
checkdepends=()
optdepends=()
provides=("walinuxagent")
backup=("etc/waagent.conf")
options=()
install=
changelog=
source=(
  "https://github.com/Azure/WALinuxAgent/archive/v${pkgver}.zip")
sha256sums=(
  '96e8123c55e3f1dc9b31733884249323a0c7db8cc27cfd1952604cd53af51f27')

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --prefix="/usr" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
