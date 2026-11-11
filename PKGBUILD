# Maintainer: faywong
pkgname=miloinput-bin
pkgver=0.1.4
pkgrel=1
pkgdesc='Milo Chinese Pinyin input method for Fcitx5 (prebuilt)'
arch=('x86_64')
url='https://miloinput.fay.wang'
license=('LicenseRef-MiloInput' 'BSD-3-Clause' 'BSD-2-Clause' 'Apache-2.0' 'MIT' 'BSL-1.0' 'GPL-3.0-only' 'CC-BY-4.0')
depends=('fcitx5>=5.1.23' 'kenlm-shared=0.3.0.r20261108' 'glibc' 'gcc-libs')
optdepends=('fcitx5-configtool: Configure input methods'
            'fcitx5-gtk: GTK application integration'
            'fcitx5-qt: Qt application integration'
            'noto-fonts-cjk: Chinese glyph coverage'
            'noto-fonts-emoji: Emoji glyph coverage')
provides=('miloinput' 'fcitx5-miloinput')
conflicts=('miloinput' 'fcitx5-miloinput')
options=('!strip' '!debug')
_archive=MiloInput-Linux-x64-v${pkgver}-arch_20261111_46e1df41.zip
source=("https://miloinput.fay.wang/downloads/${_archive}")
sha256sums=('b74d512f04aaeeda5c35352dd28033f5d2f806f088ce7882a779c7338d701b49')

package() {
    cp -a usr "$pkgdir/"
    test -x "$pkgdir/usr/lib/miloinput/miloinput-engine"
    test -f "$pkgdir/usr/lib/fcitx5/libmiloinput.so"
    test -f "$pkgdir/usr/share/miloinput/rime/sc.lm"
}
