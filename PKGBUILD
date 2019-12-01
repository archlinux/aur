# Maintainer: pancho horrillo <pancho at pancho dot name>

_pkgname='ansible-aur'
pkgname="${_pkgname}-git"
pkgver=0.24.r0.g9f52f50
pkgrel=2
pkgdesc='ansible module to install packages from AUR'
arch=('any')
url='https://github.com/kewlfft/ansible-aur'
license=('GPL3')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/kewlfft/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --tags --long | sed '
        s/^v//
        s/\([^-]*-g\)/r\1/
        y/-/./
    '
}

package() {
    cd "${_pkgname}"
    install -Dm644 README.md	"$pkgdir/usr/share/doc/${_pkgname}/README.md"
    install -Dm644 aur.py	"$pkgdir/usr/share/ansible/plugins/modules/aur.py"
}
