# Maintainer: Haoxiang Fei <tonyfettes AT tonyfettes DOT com>

pkgname=moonbit-bin
pkgver=0.1.0.20240401
pkgrel=1
pkgdesc="Intelligent developer platform for Cloud and Edge using WASM"
arch=('x86_64')
url="https://www.moonbitlang.com/"
license=('unknown')
depends=('glibc' 'gcc-libs' 'git')
provides=("moonbit")
conflicts=("moonbit")
_download_url="https://cli.moonbitlang.com/ubuntu_x86"
source=("${_download_url}/moon"
        "${_download_url}/moonc"
        "${_download_url}/moonfmt"
        "${_download_url}/moonrun"
        "${_download_url}/mooninfo"
        "${_download_url}/moondoc")
sha256sums=('1af8998cbbeb29fa1acaabb9dd0c6064940c9f8bb39312df28b6c98be0e4995a'
            'bbb49fe9a94fb6b39b4a0b18aab5102f1be658157a5daea769423d6eeefdc491'
            '15d6e5591ddbf7264a9f50955f9cd0d033e4e790ace417ccde5969585ff5e8b7'
            '7d713257c2620a6551061399e02ffdf47241640b14d8ce34cc461f96b6aa514f'
            'bab20a7cb889b4e5f342a09ae6f9c96efe1682917270fb61464828a73b81ae63'
            'abc9cadd59e33ad2d149d4e736fc38239e877f1225c390facbc4373bc1cd748c')

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
  install -Dm 755 "${srcdir}/moondoc" "${pkgdir}/usr/bin/moondoc"
}
