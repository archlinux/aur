pkgname=moonbit-bin
pkgver=0.1.20250918
pkgrel=1
pkgdesc="Intelligent developer platform for Cloud and Edge using WASM"
arch=('x86_64')
url="https://www.moonbitlang.com/"
license=('unknown')
depends=('tar' 'glibc' 'gcc-libs' 'git')
provides=("moonbit")
conflicts=("moonbit")
options=('!debug')
_origin="https://cli.moonbitlang.com"
source=("https://cli.moonbitlang.cn/binaries/latest/moonbit-linux-x86_64.tar.gz"
        "https://cli.moonbitlang.cn/cores/core-latest.tar.gz"
        "moon.sh")
sha256sums=(14158aaa2c8f39f039809ad866e66cb8a3084814828d45f3aef57d03d1636bd5  '58b177a4b0dda035620b8f5f44f1f26a251203924d1df927a8a00e0a78f9c13c')
package() {
  install -Dm 755 "${srcdir}/bin/moon"     "${pkgdir}/usr/lib/moon"
  install -Dm 755 "${srcdir}/moon.sh"  "${pkgdir}/usr/bin/moon"
  install -Dm 755 "${srcdir}/bin/moonc"    "${pkgdir}/usr/bin/moonc"
  install -Dm 755 "${srcdir}/bin/moondoc"  "${pkgdir}/usr/bin/moondoc"
  install -Dm 755 "${srcdir}/bin/moonfmt"  "${pkgdir}/usr/bin/moonfmt"
  install -Dm 755 "${srcdir}/bin/moonrun"  "${pkgdir}/usr/bin/moonrun"
  mkdir -p "${pkgdir}/usr/share/moonbit/lib"
  cp -r "${srcdir}/core" "${pkgdir}/usr/share/moonbit/lib/"
}
