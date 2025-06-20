# Maintainer: claymorwan <claymorwan@fembois.dev>
pkgname=python-ecdysys
_name=${pkgname#python-}
pkgver=0.1.5
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
sha256sums=('fb17b9c52a1c8f68befdfb74d3c954fa5a27aba717fdd41d6cf76c70fde7fde0')

package() {
	cd $srcdir
	python -m installer -d $pkgdir "$_name-$pkgver-py3-none-any.whl"
}
