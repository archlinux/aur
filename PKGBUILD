# Maintainer: MatMoul <matmoul at the google email domain which is .com>

_githubuser=Azure
_githubrepo=WALinuxAgent
_pkgtagname=v2.11.1.4

pkgname=walinuxagent
pkgver=2.11.1.4
pkgrel=1
pkgdesc='Microsoft Azure Linux Agent'
arch=('any')
url="https://github.com/${_githubuser}/${_githubrepo}"
license=('Apache')
depends=('python' 'python-distro' 'openssh' 'openssl' 'parted' 'net-tools')
makedepends=('python-setuptools')
install=${pkgname}.install
backup=('etc/waagent.conf')
source=("${_githubrepo}-${pkgver}.tar.gz::https://github.com/${_githubuser}/${_githubrepo}/archive/refs/tags/${_pkgtagname}.tar.gz")
sha256sums=('956f12e31b0903f304cc070ddcbe4c8130c10e7ccc2597061e6467e911bc085d')

package() {
	cd "${_githubrepo}-${pkgver}"
	python setup.py install --root="$pkgdir" --prefix="/usr" --optimize=1
	install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
