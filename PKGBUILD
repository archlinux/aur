# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu, Zhenyu <wuzhenyu@ustc.edu>
_pkgname=pyrime
pkgname=python-$_pkgname
pkgver=0.0.3
pkgrel=1
pkgdesc="rime for python, attached to prompt-toolkit keybindings for some prompt-toolkit applications such as ptpython"
arch=(x86_64)
url=https://github.com/Freed-Wu/$_pkgname
depends=(python librime)
makedepends=(python-installer)
license=(GPL3)
_py="cp$(python -c'import sys; print(f"{sys.version_info.major}{sys.version_info.minor}")' || echo 312)"
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-$pkgver-$_py-$_py-manylinux_2_17_x86_64.whl")
sha256sums=('c035679da2eeaaf9069d382ed03d31160b89ece8bb7b24b913647b0cf79936ac')

package() {
	python -minstaller -d"$pkgdir" ./*.whl
}
