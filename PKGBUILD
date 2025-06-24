# Maintainer: claymorwan <claymorwan@fembois.dev>
pkgname=python-lncur
_name=${pkgname#python-}
pkgver=1.0.3
pkgrel=1
pkgdesc="Python CLI to update your system packages"
arch=(any)
url="https://pypi.org/project/lncur"
license=('MIT')
makedepends=(python-installer)
provides=($_name)
conflicts=($_name)
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('b2eb96c1ad170ebc57ad0b9de4fdda7f39f61425e7e60ca8f9d10892f6d1beb0')

package() {
	cd $srcdir
	python -m installer -d $pkgdir "$_name-$pkgver-py3-none-any.whl"
}
