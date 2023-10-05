# Maintainer: Haoxiang Fei <tonyfettes AT tonyfettes DOT com>

pkgname=moonbit-bin
pkgver=52c6ffa3b
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
sha256sums=('e55a25a27e97d4c631e2243060b1553144a8542da6fdeb21ccdc849df9c208d9'
            'afd82c05159c37b2e93b9e400a199853a317a86c2085acf8d88b1cbf227f55b7'
            'eb6f5de90cc287d80bd4032f6d87acbe1289167eadbd2068924fd472408051e9'
            'b5c86ac97dfbdfac28ea8b8a567dc425434dd0ba7090f9948e338ea34faf3364'
            'a887ee48d7241c0bc1c42d011d30c57ef6946f8e51a87a83e22d2829d1604116')

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
