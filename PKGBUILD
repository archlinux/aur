# Maintainer: MatMoul <matmoul at the google email domain which is .com>

_githubuser=Azure
_githubrepo=WALinuxAgent
_pkgtagname=pre-v2.9.1.1

pkgname=walinuxagent
pkgver=2.9.1.1
pkgrel=1
pkgdesc='Microsoft Azure Linux Agent'
arch=('any')
url="https://github.com/${_githubuser}/${_githubrepo}"
license=('Apache')
depends=('python' 'python-distro' 'openssh' 'openssl' 'parted' 'net-tools')
makedepends=('python-setuptools')
install=${pkgname}.install
backup=('etc/waagent.conf')
source=("${_githubrepo}::https://github.com/${_githubuser}/${_githubrepo}/archive/refs/tags/${_pkgtagname}.tar.gz")
sha256sums=('2d4b621394dd9949553cc158a4dccff36cde1856599fe99a9d1bd0d8b031e3ee')

package() {
	cd "${_githubrepo}-${_pkgtagname}"
	python setup.py install --root="$pkgdir" --prefix="/usr" --optimize=1
	install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
