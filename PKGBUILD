# Maintainer: Alistair Young <avatar@arkane-systems.net>
pkgname=bottle-imp
pkgver=1.0
pkgrel=1
pkgdesc="A helper for WSL's native systemd support."
arch=('x86_64')
url="https://github.com/arkane-systems/bottle-imp"
license=('Unlicense')

depends=('python>=3.7' 'python-psutil' 'systemd>=232.25' 'inetutils')
conflicts=('systemd-genie')
makedepends=('git' 'python-pip')
options=(!strip)
source=("git+https://github.com/arkane-systems/bottle-imp.git")
sha256sums=('SKIP')

# pkgver() {
#    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
# }

build() {
    cd bottle-imp
    make build-binaries
}

package() {
    cd bottle-imp
    make DESTDIR=${pkgdir} internal-package
    make DESTDIR=${pkgdir} internal-supplement
}
