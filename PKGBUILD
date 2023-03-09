# Maintainer: MatMoul <matmoul at the google email domain which is .com>

_githubuser=Azure
_githubrepo=WALinuxAgent
_pkgtagname=v2.9.0.4

pkgname=walinuxagent
pkgver=2.9.0.4
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
sha256sums=('040969f507f73f3a2c95d5b0568225ad68f7f91bfec99bd92154c3fa9e28034b')

package() {
	cd "${_githubrepo}-${pkgver}"
	python setup.py install --root="$pkgdir" --prefix="/usr" --optimize=1
	install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
