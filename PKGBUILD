# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname="YoLang"
pkgver="1.2.15"
pkgrel=1
pkgdesc="Lightweight, simple interpretive programming language"
arch=("any")
url="https://github.com/PowerAngelXD/YoLang"
license=("MIT")
makedepends=("cmake"
            "make")
provides=("yolang")
source=("$pkgname-$pkgver.zip::https://github.com/PowerAngelXD/YoLang/archive/refs/heads/master.zip")
md5sums=("764407b9d4a7267dc857555a6a2fdaef")

# prepare() {
# 	cd "$pkgname-$pkgver"
# 	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
# }

build() {
	cd "$pkgname-master"
	cmake -S .
	make
}

package() {
	cd "$pkgname-master"
  mkdir "$pkgdir/usr"
  mkdir "$pkgdir/usr/bin"
  install -m=777 "yolang" "${pkgdir}/usr/bin"
}
