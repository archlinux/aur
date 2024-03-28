# Maintainer: MatMoul <matmoul at the google email domain which is .com>

_githubuser=Azure
_githubrepo=WALinuxAgent
_pkgtagname=v2.10.0.8

pkgname=walinuxagent
pkgver=2.10.0.8
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
sha256sums=('b1fb64e57cb169962cfe13e82da902545989e0224e160a5d7e8e28e75e752783')

package() {
	cd "${_githubrepo}-${pkgver}"
	python setup.py install --root="$pkgdir" --prefix="/usr" --optimize=1
	install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
