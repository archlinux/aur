pkgname='python-clipman'
_module='clipman'
_src_folder='clipman-3.3.3'
pkgver='3.3.3'
pkgrel=1
pkgdesc="Python3 module for working with clipboard. Created because pyperclip is discontinued."
url="None"
depends=('python-dbus-next')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
optdepends=(
	'xsel: clipboard support'
	'xclip: clipboard support'
	'wl-clipboard: clipboard support'
	'lemonade: clipboard support'
	'doit: clipboard support'
	'tmux: clipboard support'
	'cygutils: clipboard support for Msys2'
)
license=('custom:Mozilla Public License 2.0 (MPL 2.0)')
arch=('any')
source=("https://files.pythonhosted.org/packages/0e/a5/ca13f5e436b5eb968c41165d3adc4c5c7146f11ace92ef830ec7618f9884/clipman-3.3.3.tar.gz")
sha256sums=('80341d718ef3e5344001167e50173b2946516f8970b9180335d2de95d57f403c')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
