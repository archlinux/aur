# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=python-proton-core
_gitpkgname=python-proton-core
pkgver=0.1.15
pkgrel=3
pkgdesc="The proton-core component contains core logic used by the other Proton components."
arch=("any")
url="https://github.com/ProtonVPN/python-proton-core"
license=("GPL3")
groups=("ProtonVPN")
makedepends=("python-setuptools")
source=("git+https://github.com/ProtonVPN/${_gitpkgname}.git#commit=5e795e04094dff67c03c56f2f3de03ff43514cc4")
sha256sums=('SKIP')

build() {
    cd "$_gitpkgname"
    python setup.py build
}

package() {
    cd "$_gitpkgname"    
    python setup.py install --root="$pkgdir" --optimize=1
}
