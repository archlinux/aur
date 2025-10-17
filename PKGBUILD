# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu, Zhenyu <wuzhenyu@ustc.edu>
_pkgname=pyrime
pkgname=python-$_pkgname
pkgver=0.1.1
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
sha256sums=('423dd7caf010f7a41df62013a68b8a8a05e60dedd735547d959ac0dd61ccf9e3')

package() {
	python -minstaller -d"$pkgdir" ./*.whl
}
