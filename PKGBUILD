# Maintainer: Luigi Operoso <brokenpip3[at]gmail[dot]com>

pkgname=lxd-forward-git
_pkgname=lxd-forward
pkgver=1
pkgrel=1
pkgdesc="A simple script to simplify port forward for LXC or LXD containers"
arch=('any')
url="https://github.com/jorgeluiztaioque/lxd-forward"
license=('GPL3')
depends=('lxd' 'iptables')
makedepends=('git')
source=("git+https://github.com/jorgeluiztaioque/lxd-forward")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo "$(git rev-list --count HEAD).$(git describe --always)"
}

package () {
	cd "${_pkgname}"
	install -Dm755 lxd-forward "${pkgdir}/usr/bin/${_pkgname}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
