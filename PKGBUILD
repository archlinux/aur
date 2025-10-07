# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=python-edfio
_name=${pkgname#python-}
pkgver=0.4.10
pkgrel=1
pkgdesc="Python package for reading and writing EDF and EDF+C files"
arch=('any')
url="https://github.com/the-siesta-group/edfio"
license=('Apache-2.0')
groups=()
depends=('python' 'python-numpy')
makedepends=('python-build' 'python-hatchling' 'python-hatch-vcs' 'python-installer')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz)
noextract=()
sha1sums=('9ce92019f6b29fd489d9abbf2ff401e09d76f489')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    mkdir -p "$pkgdir/usr/share/applications"
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
