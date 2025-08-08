# Maintainer: claymorwan <claymorwan@fembois.dev>
pkgname=python-ecdysys
_name=${pkgname#python-}
pkgver=0.1.8
pkgrel=1
pkgdesc="Python CLI to update your system packages"
arch=(any)
url="https://pypi.org/project/ecdysys"
license=('MIT')
depends=(python-colorama python-toml python-yaspin)
makedepends=(python-installer)
optdepends=(
	'pacman-contrib: pacman support'
	'yay: aur support with yay'
	'paru: aur support with paru '
	'flatpak: flatpak support'
)
provides=($_name)
conflicts=($_name)
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('0cf032269234de673a88e093e64b01f6bbad4869ba41fda93bf29d1db9c51b23')

package() {
	cd $srcdir
	python -m installer -d $pkgdir "$_name-$pkgver-py3-none-any.whl"
}
