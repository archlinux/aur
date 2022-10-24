# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: XiaoDeng3386 <1744793737@qq.com>
pkgname="yolang-git"
pkgver="1.5.29"
pkgrel=2
pkgdesc="Lightweight, simple interpretive programming language"
arch=("any")
url="https://github.com/PowerAngelXD/YoLang"
license=("MIT")
makedepends=("cmake"
            "make")
provides=("yolang")
source=("$pkgname-$pkgver.zip::https://github.com/PowerAngelXD/YoLang/archive/refs/heads/master.zip")
md5sums=('71e6e985b6086edee3bf5fa56257a942')

build() {
	cd "yolang-master"
	cmake -S .
	make
}

package() {
  cd "yolang-master"
  mkdir "$pkgdir/usr"
  mkdir "$pkgdir/usr/bin"
  install -m=777 "yolang" "${pkgdir}/usr/bin"
}
