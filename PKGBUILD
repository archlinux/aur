 
# Maintainer: matmoul <matmoul at the google email domain which is .com>
# Contributor: enihcam <nanericwang at the google email domain which is .com>
# Contributor: Arun <cute.tec at the google email domain which is .com>

pkgname=walinuxagent
_pkgname=WALinuxAgent
pkgver=2.2.51
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
sha256sums=('2594573b3ac9cc814ad3079a7739140947bc80f43b758a1d4d931393b107d0a4')

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --prefix="/usr" --optimize=1
	install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
