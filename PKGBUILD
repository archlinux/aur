# Maintainer: Hao Zhang <hao [AT] hao-zhang.com>
# Contributor: Bian Jiaping <ssbianjp [AT] gmail.com>
# Contributor: Jove Yu <yushijun110 [AT] gmail.com>
# Contributor: csslayer <wengxt [AT] gmail.com>
# Contributor: Felix Yan <felixonmars [AT] gmail.com>

pkgname=fcitx-sogoupinyin
pkgver=4.0.1.2800
_time=1656597217
_basename=${pkgname:6}
pkgrel=2
pkgdesc="Sogou Pinyin for Linux"
arch=("x86_64")
url="https://shurufa.sogou.com/linux"
license=("custom")
depends=("fcitx" "opencc" "libidn11" "lsb-release" "xorg-xprop" "qt5-declarative" "qt5-svg" "fcitx-qt5" "libxss")

source=("https://ime.sogoucdn.com/dl/gzindex/$_time/${pkgname:6}_${pkgver}_${arch[0]}.deb")
sha256sums=("5d851c647c8b02c7f0b1853c3e516bfd1bdd9c5628333c07e9851a617336deb7")

package(){
    cd $srcdir

    tar -xJvf data.tar.xz -C "$pkgdir"

    mv "$pkgdir"/usr/lib/*-linux-gnu/fcitx "$pkgdir"/usr/lib/
    rmdir "$pkgdir"/usr/lib/*-linux-gnu

    find $pkgdir/opt/sogoupinyin/files/{.license,share} -type d -exec chmod 755 {} \;
    find $pkgdir/opt/sogoupinyin/files/{.license,share} -type f -exec chmod 644 {} \;
}
