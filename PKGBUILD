pkgname="owo-git"
pkgver=r18.fd3536e
pkgrel=1
pkgdesc="cli owoifier"
arch=("any")
license=("GPL")
makedepends=("git")
url="https://code.pyuku.com/neko/owo"
source=("git+https://code.pyuku.com/neko/owo.git")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
md5sums=('SKIP')

build() {
        cd "${pkgname%-git}"
        make
}

package() {
        cd "${pkgname%-git}"
        make DESTDIR="${pkgdir}" PREFIX="/usr" install
}

pkgver() {
	cd "${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
