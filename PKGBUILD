# Maintainer: Parham Alvani <parham.alvani at gmail dot com>
pkgname=pasadizo-bin
pkgver=1.15.0_alpha.14_pasadizo.3
pkgrel=1
pkgdesc='Proxy platform derived from sing-box, for a home gateway on a lossy, filtered line'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/pasadizo-net/pasadizo'
license=('GPL-3.0-or-later')
provides=('pasadizo')
conflicts=('pasadizo')
backup=('etc/pasadizo/config.json')
_version='1.15.0-alpha.14-pasadizo.3'
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${_version}/pasadizo-${_version}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${_version}/pasadizo-${_version}-linux-arm64.tar.gz")
source_armv7h=("${pkgname}-${pkgver}-armv7h.tar.gz::${url}/releases/download/v${_version}/pasadizo-${_version}-linux-armv7.tar.gz")
sha256sums_x86_64=('822888acd167db4944b05677e60a65bba79989e3a525ce08b877ea73e9713e4a')
sha256sums_aarch64=('5fc360f4a12b8056411b7e55111fcea51e6d3cb04a3a7036a3b5fd420655c775')
sha256sums_armv7h=('dec2033d22a2c4939c5da509582e17ef00c2ee8375bcef0fe7afadc104dc79f6')

package() {
  install -Dm755 "./pasadizo" "${pkgdir}/usr/bin/pasadizo"
  install -Dm644 "./systemd/pasadizo.service" "${pkgdir}/usr/lib/systemd/system/pasadizo.service"
  install -Dm644 "./systemd/pasadizo@.service" "${pkgdir}/usr/lib/systemd/system/pasadizo@.service"
  install -Dm644 "./config.json" "${pkgdir}/etc/pasadizo/config.json"
  install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "./README.md" "${pkgdir}/usr/share/doc/pasadizo/README.md"
}
