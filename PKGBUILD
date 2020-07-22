 
# Maintainer: matmoul <matmoul at the google email domain which is .com>
# Contributor: enihcam <nanericwang at the google email domain which is .com>
# Contributor: Arun <cute.tec at the google email domain which is .com>

pkgname=walinuxagent
_pkgname=WALinuxAgent
pkgver=2.2.49.2
pkgrel=1
pkgdesc="Microsoft Azure Linux Guest Agent"
arch=('any')
url="https://github.com/Azure/WALinuxAgent"
license=('Apache')
depends=('python' 'python-distro' 'openssh' 'openssl' 'parted' 'net-tools')
makedepends=('python-setuptools')
checkdepends=()
optdepends=()
install=${pkgname}.install
provides=("walinuxagent")
backup=("etc/waagent.conf")
options=()
changelog=
source=("https://github.com/Azure/WALinuxAgent/archive/v${pkgver}.tar.gz")
sha256sums=('00d309e6b364825bcdddd0b1be2cf17a47d3ff5b263ac38ed7b4216c912cf663')

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --prefix="/usr" --optimize=1
	install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
