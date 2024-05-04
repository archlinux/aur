# Maintainer: mattski <redmattski at gmail dot com>

pkgname=python-audible-cli
_name=${pkgname#python-}
pkgver=0.3.1
pkgrel=1
pkgdesc='Command line interface (cli) for the audible package.'
arch=(any)
url=https://github.com/mkb79/audible-cli
license=(AGPL3)
depends=('python' 'python-aiofiles' 'python-audible' 'python-click' 'python-httpx' 'python-packaging' 'python-pillow' 'python-questionary' 'python-tabulate' 'python-toml' 'python-tqdm')
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=()
provides=($pkgname)
conflicts=($pkgname)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e4b712d3a3f0bd74c39048a277704c5bff0590c3c914c54644a295326eadb241')

build() {
    cd $srcdir/${_name}-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $srcdir/${_name}-$pkgver
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
