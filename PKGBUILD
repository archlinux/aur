# Maintainer: Chance Chen <ufbycd@163.com>
pkgname=python-easyeda2kicad-git
pkgver=v0.6.5.r22.g8eeaab0
pkgrel=1
pkgdesc="Convert any LCSC components (including EasyEDA) to KiCad library"
arch=('any')
url="https://github.com/uPesy/easyeda2kicad.py"
license=('AGPL')
groups=()
depends=('python')
makedepends=('python-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd $pkgname
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $pkgname
    python setup.py build
}

package() {
    cd $pkgname
    python setup.py install --root="$pkgdir" --skip-build
}
