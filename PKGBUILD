# Maintainer: Hao Zhang <hao [AT] hao-zhang.com>
# Contributor: Bian Jiaping <ssbianjp [AT] gmail.com>
# Contributor: Jove Yu <yushijun110 [AT] gmail.com>
# Contributor: csslayer <wengxt [AT] gmail.com>
# Contributor: Felix Yan <felixonmars [AT] gmail.com>

pkgname=fcitx-sogoupinyin
pkgver=2.4.0.2732
_time=1605612770
pkgrel=1
pkgdesc="Sogou Pinyin for Linux"
arch=("x86_64")
url="https://pinyin.sogou.com/linux/"
license=("custom")
depends=("fcitx" "opencc" "libidn11" "lsb-release" "xorg-xprop" "qt5-declarative" "qt5-svg" "fcitx-qt5")

source=("sogou-autostart"
	"http://cdn2.ime.sogou.com/dl/index/${_time}/sogoupinyin_${pkgver}_amd64.deb")
sha256sums=("4357c28ba35d9441e47cc5c9a4c5f1ccbb8957cb3434212a609201aee485c092"
            "2ec8a0d937b1d8ae987a1a5684b444918524c93d32cdef84228d5a0ff8ac5b2f")

package(){
    cd ${srcdir}

    tar -xJvf data.tar.xz -C "${pkgdir}"

    mv "$pkgdir"/usr/lib/*-linux-gnu/fcitx "$pkgdir"/usr/lib/
    rmdir "$pkgdir"/usr/lib/*-linux-gnu
}
