# Maintainer: Haoxiang Fei <tonyfettes AT tonyfettes DOT com>

pkgname=moonbit-bin
pkgver=e965c14fb
pkgrel=1
pkgdesc="Intelligent developer platform for Cloud and Edge using WASM"
arch=('x86_64')
url="https://www.moonbitlang.com/"
license=('unknown')
depends=('glibc' 'gcc-libs')
provides=("moonbit")
conflicts=("moonbit")
source=("https://cli.moonbitlang.cn/ubuntu_x86/moon"
        "https://cli.moonbitlang.cn/ubuntu_x86/moonc"
        "https://cli.moonbitlang.cn/ubuntu_x86/moonfmt"
        "https://cli.moonbitlang.cn/ubuntu_x86/moonrun"
        "https://cli.moonbitlang.cn/ubuntu_x86/mooninfo")
sha256sums=('8bf631f74c6d621bea6bfde4f7d5414ee987c75c21263404a50a0b7971c2e169'
            '506d3f847e61973ed700c7e002ead269ab4383cf055a28f6b3a33a73c99c1658'
            'fde78fb988ffe0d4db6ed41c344ac9360c63f1c35cd205d79224cb3c471e19b0'
            'b5c86ac97dfbdfac28ea8b8a567dc425434dd0ba7090f9948e338ea34faf3364'
            '68026772ca4306e4ef5cf788a4587b40ec4c4f777949ea6af846302eb8be86b1')

pkgver() {
  cd "${srcdir}"
  chmod +x moonc
  ./moonc -v
}

package() {
  install -Dm 755 "${srcdir}/moon"     "${pkgdir}/usr/bin/moon"
  install -Dm 755 "${srcdir}/moonc"    "${pkgdir}/usr/bin/moonc"
  install -Dm 755 "${srcdir}/moonfmt"  "${pkgdir}/usr/bin/moonfmt"
  install -Dm 755 "${srcdir}/moonrun"  "${pkgdir}/usr/bin/moonrun"
  install -Dm 755 "${srcdir}/mooninfo" "${pkgdir}/usr/bin/mooninfo"
}
