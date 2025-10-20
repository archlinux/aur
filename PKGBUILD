# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu, Zhenyu <wuzhenyu@ustc.edu>
_pkgname=pyrime
pkgname=python-$_pkgname
pkgver=0.1.2
pkgrel=1
pkgdesc="rime for python, attached to prompt-toolkit keybindings for some prompt-toolkit applications such as ptpython"
arch=(x86_64)
url=https://github.com/Freed-Wu/$_pkgname
depends=(python librime python-platformdirs)
makedepends=(python-installer)
optdepends=(ptpython python-prompt_toolkit)
license=(GPL3)
_py="cp$(python -c'import sys; print(f"{sys.version_info.major}{sys.version_info.minor}")' || echo 313)"
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-$pkgver-$_py-$_py-manylinux_2_17_x86_64.whl")
sha256sums=('b74e1c6bb75e74a08e8a960138d098a3d0e6c7074a117d9db295b8dfa89c0a4b')

package() {
	python -minstaller -d"$pkgdir" ./*.whl
}
