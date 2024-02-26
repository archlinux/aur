pkgbase='python-hwmon'
pkgname=('python-hwmon')
_module='hwmon'
_src_folder='hwmon-1.0'
pkgver='1.0'
pkgrel=1
pkgdesc="Hwmon is a collection of Python 3 scripts which are a native Python solution for obtaining information from Linux system sensors."
url="https://github.com/Guillermo-C-A/Hwmon-python"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('custom:GNU General Public License v3 (GPLv3)')
arch=('any')
source=("https://files.pythonhosted.org/packages/3d/3c/d1f552e63b2c1f4ea462c1f788801f88a64a22f3c59275a8596564abb5fe/hwmon-1.0.tar.gz")
sha256sums=('fc55b08e45e8897797b8af2f7bc7acee9fd33941af10fe2ee43b6b31fca2437c')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
