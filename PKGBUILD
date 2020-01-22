# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Mehmet Ozgur Bayhan <mozgurbayhan at gmail.com>
# Contributor: Thomas Quillan <tjquillan at gmail.com>
# Contributor: iboyperson <tjquillan at gmail dot com>
# Contributor: Alessandro Pazzaglia <jackdroido at gmail dot com>
pkgname=pyinstaller
_name=PyInstaller
pkgver=3.6
pkgrel=5
pkgdesc="Bundles a Python application and all its dependencies into a single package"
arch=('any')
url="http://www.pyinstaller.org"
license=('GPL')
depends=('python-altgraph' 'python-macholib' 'python-pefile')
makedepends=('python-setuptools')
optdepends=('python-crypto: executable encryption support'
            'upx: executable compression support')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
#source=("https://github.com/pyinstaller/pyinstaller/releases/download/v$pkgver/$_name-$pkgver.tar.gz"{,.asc})
sha256sums=('3730fa80d088f8bb7084d32480eb87cbb4ddb64123363763cf8f2a1378c1c4b7')
            #'SKIP')
#validpgpkeys=("D4AD8B9C167B757C4F08E8777B752811BF773B65")

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
