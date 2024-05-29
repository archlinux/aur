# Maintainer: Benjamin Asbach <archlinux-aur.${pkgname}@impl.it>

_pkgname='openvpn3-indicator'
pkgname="${_pkgname}-git"
pkgver=r53.a00ecaa
pkgrel=1
pkgdesc='Simple GTK indicator GUI for OpenVPN 3 Linux'

url='https://github.com/OpenVPN/openvpn3-indicator'
arch=('any')
license=('AGPL')
depends=('openvpn3' 'libayatana-appindicator' 'python-secretstorage' 'python-setproctitle')
makedepends=('git' 'zip')
source=("${_pkgname}::git+https://github.com/OpenVPN/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir"/"$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir"/"$_pkgname"
    make DESTDIR="$pkgdir" PREFIX="/usr" package
}
