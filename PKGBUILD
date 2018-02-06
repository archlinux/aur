# See http://wiki.archlinux.org/index.php/Python_Package_Guidelines for more
# information on Python packaging.

# Maintainer: Nekmo <contacto@nekmo.com>
_pkgname="amazon-dash"
pkgname="${_pkgname}-git"
source=("$_pkgname::git+https://github.com/Nekmo/amazon-dash.git")
pkgver=v0.4.0.r0.g17672a1
pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgrel=1
pkgdesc="Hack your Amazon Dash to run what you want."
arch=("any")
url="https://github.com/Nekmo/amazon-dash"
license=('MIT')
groups=()
depends=('scapy3k' 'python-yaml' 'python-jsonschema' 'python-requests' 'python-click' 'python-click-default-group')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=amazon-dash.install
md5sums=("SKIP")
#source=()
#md5sums=()

build() {
    cd "${srcdir}/${_pkgname}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_pkgname}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
