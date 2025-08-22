# Maintainer: claymorwan <claymorwan@fembois.dev>
pkgname=ecdysys
_name=${pkgname#python-}
pkgver=0.1.9
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
sha256sums=('4e8f0e391540252007a43ff8231ebaf95f66793afdc2aa87cbf34809249d373a')

package() {
	cd $srcdir
	python -m installer -d $pkgdir "$_name-$pkgver-py3-none-any.whl"
}
