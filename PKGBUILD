# Maintainer: Thomas Quillan <tjquillan@gmail.com>
# Contributor: Alessandro Pazzaglia <jackdroido at gmail dot com>

pkgname=pyinstaller
_pyname=PyInstaller
pkgver=3.4
pkgrel=1
pkgdesc="An application to convert python scripts into stand-alone binaries"
arch=('i686' 'x86_64')
url="http://www.pyinstaller.org"
license=('GPL')
depends=('python'
	 'python-macholib'
	 'python-pefile'
	 'python-altgraph')
makedepends=('python-setuptools')
optdepends=('python-crypto: executable encryption support'
	    'upx: executable compression support')
conflicts=('pyinstaller-git')
source=("https://github.com/pyinstaller/pyinstaller/releases/download/v${pkgver}/${_pyname}-${pkgver}.tar.gz"
	"https://github.com/pyinstaller/pyinstaller/releases/download/v${pkgver}/${_pyname}-${pkgver}.tar.gz.asc")
validpgpkeys=("D4AD8B9C167B757C4F08E8777B752811BF773B65")
sha256sums=('a5a6e04a66abfcf8761e89a2ebad937919c6be33a7b8963e1a961b55cb35986b'
            'SKIP')

build() {
	cd "${srcdir}/${_pyname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pyname}-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
