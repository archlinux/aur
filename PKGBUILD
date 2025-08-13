pkgname='python-wikiteam3'
_module='wikiteam3'
_src_folder='wikiteam3-4.4.4'
pkgver='4.4.4'
pkgrel=1
pkgdesc="Tools for downloading and preserving MediaWikis. We archive MediaWikis, from Wikipedia to tiniest wikis."
url="https://github.com/saveweb/wikiteam3"
depends=('python' 'python-requests' 'python-internetarchive' 'python-lxml' 'python-mwclient' 'python-file-read-backwards' 'python-slugify' '7zip' 'zstd')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-pdm-backend')
license=('GPL-3.0-or-later')
arch=('any')
source=("https://files.pythonhosted.org/packages/bc/a3/3344a05977a9fe39131de24eea6b22eec786a68bc411d8581e5bb7b4def4/wikiteam3-4.4.4.tar.gz")
sha256sums=('edcb999ebb0720141356ea3a7dcdcd8e4dcf17ffe99f8dfe459763f9f8921bb3')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
