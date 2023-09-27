# Maintainer: Viktor Tereshchenko < m0nochr0me at gmail dot com >
pkgname="shyysh-git"
_gitpkg="shyysh"
_gitcommit="c36db5a6f12ab7a92d610387034c644855b50b1b"
pkgver="0.0.7"
pkgrel="0"
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
