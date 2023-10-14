# Maintainer: Haoxiang Fei <tonyfettes AT tonyfettes DOT com>

pkgname=moonbit-bin
pkgver=7ea80aab5
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
sha256sums=('e12bd3dc5f1336151b823a26710cfa6f7866ea9826bd06b9442457bc3b323da1'
            '94f83035f97a63e9cbac3730ebd2e863c3ab2e01652ba826be53a6ccdf171882'
            'c59bee21d4aff6c0dc531c5e1672738f7084f348cf5a40b01a364293cd314632'
            'b5c86ac97dfbdfac28ea8b8a567dc425434dd0ba7090f9948e338ea34faf3364'
            '928b56366e4e827a4d989a37183d5b736a38f2c8275f3fa9fb3da96f2c588aac')

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
