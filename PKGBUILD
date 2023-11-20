# Maintainer: Haoxiang Fei <tonyfettes AT tonyfettes DOT com>

pkgname=moonbit-bin
pkgver=0.1.0.20231120
pkgrel=1
pkgdesc="Intelligent developer platform for Cloud and Edge using WASM"
arch=('x86_64')
url="https://www.moonbitlang.com/"
license=('unknown')
depends=('glibc' 'gcc-libs' 'openssl-1.1')
provides=("moonbit")
conflicts=("moonbit")
source=("https://cli.moonbitlang.com/ubuntu_x86/moon"
        "https://cli.moonbitlang.com/ubuntu_x86/moonc"
        "https://cli.moonbitlang.com/ubuntu_x86/moonfmt"
        "https://cli.moonbitlang.com/ubuntu_x86/moonrun"
        "https://cli.moonbitlang.com/ubuntu_x86/mooninfo")
sha256sums=('61a7cfb06f69edda870d17d368ed0adf50d1166c33f415eaee586c5eadab256d'
            '4ecf96beeaff41a9e8be290d118281e454ae997cb7ebb5eeda58d4a20750c62e'
            '1d22f753eb948e0d71f15261326ef8ef5f2d4a5acd8e6f17989bd9cd4b5fac23'
            '11c56639a22fc2b2825dcb1d65b51eca44d9173935af4f54af69f1e2d9f1684e'
            '05b981d5d3b3df7d4a8542557fcda65659519885aeb7d86ff2f7a5a83ef54b77')

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
