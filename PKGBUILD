pkgname="owo-git"
pkgver=0
pkgrel=1
pkgdesc="cli owoifier"
arch=("any")
license=("GPL")
makedepends=("git")
url="https://code.pyuku.com/neko/owo"
source=("git://code.pyuku.com/neko/owo.git")

build() {
        cd "$pkgname"
        make
}

package() {
        cd "$pkgname"
        make DESTDIR="${pkgdir}" PREFIX="/usr" install
}

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

md5sums=('SKIP')
