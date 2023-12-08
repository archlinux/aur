# Maintainer: Haoxiang Fei <tonyfettes AT tonyfettes DOT com>

pkgname=moonbit-bin
pkgver=0.1.0.20231204
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
sha256sums=('9b6cd3830b457cc44deaf6f050603bf073e988b173a2f01cb9fddead1bbe83a0'
            '071816387f1febf7edb2724783c857f83779af4f901068d70ef002666fb18209'
            '44deb6621f177da1580248c020ac00282502bfc0728bd4016d23f8eeed957ee8'
            '6005aa72c4a520da457674e9052259b8e08d5f788a1636f0f7c99bd7c0891b64'
            '9166e22cc83749bb9b34eedd43d839e738f4df81c718cc2cbb00b2e3d722e0fc')

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
