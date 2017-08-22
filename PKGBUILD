# Maintainer: enihcam <nanericwang at the google email domain which is .com>
# Contributor: Arun <cute.tec at the google email domain which is .com>

pkgname=walinuxagent
_pkgname=WALinuxAgent
pkgver=2.2.14.3
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
  '1949f5cc7d994a56ad7fee80d13d80bed1ad5c99f41e2219d93ee894efebd77a')

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --prefix="/usr" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
