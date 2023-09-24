# Maintainer: Haoxiang Fei <tonyfettes AT tonyfettes DOT com>

pkgname=moonbit-bin
pkgver=27900a294
pkgrel=1
pkgdesc="Intelligent developer platform for Cloud and Edge using WASM"
arch=('x86_64')
url="https://www.moonbitlang.com/"
license=('unknown')
depends=('glibc' 'gcc-libs')
provides=("moonbit")
conflicts=("moonbit")
source=("https://cli.moonbitlang.com/ubuntu_x86/moon"
        "https://cli.moonbitlang.com/ubuntu_x86/moonc"
        "https://cli.moonbitlang.com/ubuntu_x86/moonfmt"
        "https://cli.moonbitlang.com/ubuntu_x86/moonrun"
        "https://cli.moonbitlang.com/ubuntu_x86/mooninfo")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

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
