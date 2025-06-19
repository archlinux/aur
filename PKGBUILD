# Maintainer: claymorwan <claymorwan@fembois.dev>
pkgname=python-ecdysys
_name=${pkgname#python-}
pkgver=0.1.4
pkgrel=1
pkgdesc="Python CLI to update your system packages"
arch=(any)
url="https://pypi.org/project/ecdysys"
license=('MIT')
depends=(python-colorama python-toml pacman-contrib)
makedepends=(python-build python-installer python-wheel)
optdepends=(
	'pacman-contrib: pacman support'
	'yay: aur support with yay'
	'paru: aur support with paru '
	'flatpak: flatpak support'
)
provides=($_name)
conflicts=($_name)
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('e014ce08ddade98ad3b6a92ce245ebbe9721efbeb19c193a6237b7f47c246210')

package() {
	cd $srcdir
	python -m installer -d $pkgdir "$_name-$pkgver-py3-none-any.whl"
}
