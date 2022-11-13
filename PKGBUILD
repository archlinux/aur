# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: XiaoDeng3386 <1744793737@qq.com>
pkgname="yolang-git"
pkgver="1.5.40"
pkgrel=2
pkgdesc="Lightweight, simple interpretive programming language"
arch=("any")
url="https://github.com/PowerAngelXD/YoLang"
license=("MIT license")
makedepends=("cmake" "git")
provides=("yolang")
source=("$pkgname-$pkgver.zip::https://github.com/PowerAngelXD/YoLang/archive/refs/tags/Release-2022-11-0160.zip")
md5sums=("f6266e901d0a807e6ce7965f255abf77")

build() {
	cmake -B build -S YoLang-Release-2022-11-0160 -Wno-dev -DCMAKE_INSTALL_PREFIX='/usr' 
	make -C build
}

package() {
  mkdir "$pkgdir/usr"
  mkdir "$pkgdir/usr/bin"
  mkdir "$pkgdir/usr/share"
  mkdir "$pkgdir/usr/share/licenses"
  mkdir "$pkgdir/usr/share/licenses/yolang"

  install -m=755 "build/yolang" "${pkgdir}/usr/bin"
  install -m=755 "YoLang-Release-2022-11-0160/LICENSE" "${pkgdir}/usr/share/licenses/yolang"
}
