# Maintainer: Haoxiang Fei <tonyfettes AT tonyfettes DOT com>

pkgname=moonbit-bin
pkgver=0.1.0.20231106
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
sha256sums=('c3d9b13b99c7aaed50a5397e6a482d023eece07c0121492e8aa873e362b180aa'
            'cc40ab9c603fbf3b532e985aa19e74570b1733b01e71650dd14204d078630c84'
            'b6038f3a4872b62c85fa7cb61d69d9d895452cea4b415146f671b1e1e022594b'
            '11c56639a22fc2b2825dcb1d65b51eca44d9173935af4f54af69f1e2d9f1684e'
            'c38768654c193b94a0f7912d3d5cb1b9532c7d8c45bb5d9ef50648333baaa533')

pkgver() {
  cd "${srcdir}"
  chmod +x moon
  ./moon version | grep 'moon ' | sed -E 's/moon ([0-9.]+) \((\w+) ([0-9]{4})-([0-9]{2})-([0-9]{2})\)/\1.\3\4\5/g'
}

package() {
  install -Dm 755 "${srcdir}/moon"     "${pkgdir}/usr/bin/moon"
  install -Dm 755 "${srcdir}/moonc"    "${pkgdir}/usr/bin/moonc"
  install -Dm 755 "${srcdir}/moonfmt"  "${pkgdir}/usr/bin/moonfmt"
  install -Dm 755 "${srcdir}/moonrun"  "${pkgdir}/usr/bin/moonrun"
  install -Dm 755 "${srcdir}/mooninfo" "${pkgdir}/usr/bin/mooninfo"
}
