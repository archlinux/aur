# Maintainer: Hao Zhang <hao [AT] hao-zhang.com>
# Contributor: Bian Jiaping <ssbianjp [AT] gmail.com>
# Contributor: Jove Yu <yushijun110 [AT] gmail.com>
# Contributor: csslayer <wengxt [AT] gmail.com>
# Contributor: Felix Yan <felixonmars [AT] gmail.com>

pkgname=fcitx-sogoupinyin
pkgver=2.3.2.07
_time=1598240917
pkgrel=1
pkgdesc="Sogou Pinyin for Linux"
arch=("x86_64")
url="https://pinyin.sogou.com/linux/"
license=("custom")
depends=("fcitx" "opencc" "libidn11" "lsb-release" "xorg-xprop" "qt5-webkit" "fcitx-qt5")

source=("sogou-autostart"
	"http://cdn2.ime.sogou.com/dl/index/${_time}/sogoupinyin_${pkgver}_amd64.deb")
sha256sums=("4357c28ba35d9441e47cc5c9a4c5f1ccbb8957cb3434212a609201aee485c092"
           "7d740223747a5fc3c2044b97ac81916d78b687ce7d2ed5bd76d012167ab7b2c9")

package(){
    cd ${srcdir}

    tar -xJvf data.tar.xz -C "${pkgdir}"

    mv "$pkgdir"/usr/lib/*-linux-gnu/fcitx "$pkgdir"/usr/lib/
    rmdir "$pkgdir"/usr/lib/*-linux-gnu
}
