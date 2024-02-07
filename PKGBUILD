# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=python-proton-vpn-session
_gitpkgname=python-proton-vpn-session
_gitcommit=5864beddfc638d802d388dfefafb414afbdedd61
pkgver=0.6.5
pkgrel=1
pkgdesc="The proton-vpn-session component provides utility classes to manage VPN sessions."
arch=("any")
url="https://github.com/ProtonVPN/python-proton-vpn-session"
license=("GPL3")
groups=("ProtonVPN")
makedepends=("git" "python-setuptools")
#source=("git+https://github.com/ProtonVPN/${_gitpkgname}.git#tag=${pkgver}")
source=("git+https://github.com/ProtonVPN/${_gitpkgname}.git#commit=${_gitcommit}")
sha256sums=('SKIP')

build() {
    cd "$_gitpkgname"
    python setup.py build
}

package() {
    cd "$_gitpkgname"    
    python setup.py install --root="$pkgdir" --optimize=1
}
