# Maintainer: Brokenpip3 <brokenpip3[at]gmail[dot]com>
pkgname=k8sh-git
pkgver=1
pkgrel=1
pkgdesc="A simple, easily extensible shell for navigating your kubernetes clusters"
arch=('any')
url="https://github.com/Comcast/k8sh"
license=('Apache')
depends=('bash')
makedepends=('git')
provides=('k8sh')
source=('git+https://github.com/Comcast/k8sh')
md5sums=('SKIP')

_pkgname=k8sh

pkgver() {
    cd "${srcdir}/${_pkgname}"
    echo "$(git rev-list --count HEAD).$(git describe --always)"
}

package() {
	cd "$srcdir/$_pkgname"
	install -D ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
