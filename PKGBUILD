# Maintainer: Viktor Tereshchenko < m0nochr0me at gmail dot com >
pkgname="shyysh-git"
_gitpkg="shyysh"
_gitcommit="e09f9283d32ded405695e78d6275edf90ed081d6"
pkgver="0.0.2"
pkgrel="1"
pkgdesc="TUI SSH Connection Manager"
arch=("any")
url="https://github.com/m0nochr0me/shyysh"
license=("MIT")
makedepends=("python-setuptools")
depends=(
    "python-asciimatics"
    "python-tinydb"
    "python-pyaml"
    "python-libtmux"
)
provides=("shyysh")
source=("shyysh-${pkgver}-${pkgrel}.tar.gz::https://github.com/m0nochr0me/shyysh/archive/${_gitcommit}.tar.gz")
sha256sums=("SKIP")

build() {
    cd "${srcdir}/${_gitpkg}-${_gitcommit}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_gitpkg}-${_gitcommit}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm 644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
