# Maintainer: kal39 <kal390983@gmail.com>
pkgname=ptmv-git
pkgver=46b3d29
pkgrel=1
epoch=
pkgdesc="An utf-8/truecolor image and video viewer for the terminal."
arch=(any)
url="https://github.com/kal39/ptmv.git"
license=('MIT')
groups=()
depends=(youtube-dl python)
makedepends=(git python python-setuptools)
checkdepends=()
optdepends=()
provides=(ptmv)
conflicts=(ptmv)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "ptmv"
  git describe --long --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "ptmv"
	python setup.py build
}

package() {
	cd "ptmv"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
