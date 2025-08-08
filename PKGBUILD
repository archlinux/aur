# Maintainer: claymorwan <claymorwan@fembois.dev>
pkgname=python-ecdysys
_name=${pkgname#python-}
pkgver=0.1.7
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
sha256sums=('7222689bd5920568a0fcdcda44388b404be8f21fa9d0708d64c08c721031ac89')

package() {
	cd $srcdir
	python -m installer -d $pkgdir "$_name-$pkgver-py3-none-any.whl"
}
