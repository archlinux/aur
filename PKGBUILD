# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: claymorwan <claymorwan@fembois.dev>
pkgname=python-ecdysys
_name=${pkgname#python-}
pkgver=0.1.2
pkgrel=1
pkgdesc=""
arch=(any)
url="https://pypi.org/project/ecdysys"
license=('MIT')
depends=(python-colorama python-toml pacman-contrib)
makedepends=(python-build python-installer python-wheel)
provides=($_name)
conflicts=($_name)
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('8cadc64830b394eed0e79ae4ee3e5bea0b630ca2936c18865fb86e07a94a7968')

#build() {
#	cd $srcdir/$_name
#	python -m build --wheel --no-isolation
#}

package() {
	cd $srcdir
	ls
	python -m installer --destdir="$pkgdir" *.whl
}
