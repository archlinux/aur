# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=python-powerline-taskwarrior
pkgver=2.0.0
pkgrel=18
pkgdesc='Powerline segment for showing information from Taskwarrior task manager'
url='https://github.com/Zebradil/powerline-taskwarrior'
arch=(any)
license=(MIT)
install=''
depends=(python-powerline python3 task)
makedepends=(python-build python-installer python-poetry-core python-wheel)
source=(https://files.pythonhosted.org/packages/source/p/powerline-taskwarrior/powerline-taskwarrior-2.0.0.tar.gz)
build () 
{ 
    set -eo pipefail;
    cd "${pkgname#python-}-$pkgver";
    python -m build --wheel --no-isolation
}
package () 
{ 
    set -eo pipefail;
    cd "${pkgname#python-}-$pkgver";
    python -m installer --destdir="$pkgdir" dist/*.whl
}
sha256sums=('479ef617064383478753c63d0b1d994dd2c02ef8b056310b6eb8186284a38649')
