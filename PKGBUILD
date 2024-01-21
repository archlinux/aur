# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=alacritty-colorscheme-git
pkgver=r51.257e466
pkgrel=2
pkgdesc='Change colorscheme of alacritty with ease'
url='https://github.com/zebradil/alacritty-colorscheme/'
arch=(any)
license=(Apache)
install=''
depends=(python-ruamel-yaml python-typed-argument-parser python-pynvim)
makedepends=(python-build python-installer python-poetry-core python-wheel)
conflicts=(alacritty-colorscheme)
provides=(alacritty-colorscheme)
source=(git+https://github.com/zebradil/alacritty-colorscheme.git)
sha256sums=(SKIP)
build () 
{ 
    ( set -eo pipefail;
    cd "${_z_pkgname}";
    python -m build --wheel )
}
package () 
{ 
    ( set -eo pipefail;
    cd "${_z_pkgname}";
    python -m installer --destdir="$pkgdir" dist/*.whl )
}


# Custom variables

_z_aur_deps=([0]="python-typed-argument-parser")
_z_pkgname="alacritty-colorscheme"
