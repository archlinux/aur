# Maintainer: jasle <jasle at riseup dot net>

_pkgname='ansible-keepass'
pkgname="${_pkgname}-git"
pkgver=r11.1f0388e
pkgrel=1
pkgdesc='Ansible plugin to fetch data from KeePass database file'
arch=('any')
url='https://github.com/viczem/ansible-keepass'
license=('MIT')
depends=('ansible' 'python-pykeepass')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/viczem/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
	cd "${_pkgname}"
	install -Dm644 README.md "$pkgdir/usr/share/doc/${_pkgname}/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 keepass.py "$pkgdir/usr/share/ansible/plugins/lookup/keepass.py"
}
