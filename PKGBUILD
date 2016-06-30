# Maintainer: Tomas Kral <tomas.kral@gmail.com>
pkgname=nvpy-git
pkgver=r430.d1c926c
pkgrel=1
pkgdesc="Simplenote syncing note-taking application, inspired by Notational Velocity and ResophNotes, but uglier and cross-platformerer."
arch=("any")
url="https://github.com/cpbotha/nvpy"
license=("BSD")
depends=("python2-docutils" "python2-markdown" "python2-setuptools" "python2-pmw")
makedepends=("git" "python2")
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("nvpy::git+https://github.com/cpbotha/nvpy.git")
md5sums=("SKIP")

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
}

package() {
	cd "$srcdir/${pkgname%-git}"
    python2 setup.py install --root="$pkgdir/" --optimize=1
    mkdir -p  $pkgdir/usr/share/licenses/$pkgname
    cp LICENSE.txt  $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
