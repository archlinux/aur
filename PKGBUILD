# Maintainer: Parham Alvani <parham.alvani at gmail dot com>
pkgname=pasadizo-bin
pkgver=1.15.0_alpha.14_pasadizo.5
pkgrel=1
pkgdesc='Proxy platform derived from sing-box, for a home gateway on a lossy, filtered line'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/pasadizo-net/pasadizo'
license=('GPL-3.0-or-later')
provides=('pasadizo')
conflicts=('pasadizo')
backup=('etc/pasadizo/config.json')
_version='1.15.0-alpha.14-pasadizo.5'
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${_version}/pasadizo-${_version}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${_version}/pasadizo-${_version}-linux-arm64.tar.gz")
source_armv7h=("${pkgname}-${pkgver}-armv7h.tar.gz::${url}/releases/download/v${_version}/pasadizo-${_version}-linux-armv7.tar.gz")
sha256sums_x86_64=('1317b56c6bce64bc07757ea42000e289631979275014f922fa8baaf036d0fee3')
sha256sums_aarch64=('e48e27d0035fbef93df3474a6132e9f2816d02160998ea0fe3e6db5d7b2582d7')
sha256sums_armv7h=('1a69a6476cae27c81c63ce7365a7fb60d5ee4605fd550246a98bbd29d2560990')

package() {
  install -Dm755 "./pasadizo" "${pkgdir}/usr/bin/pasadizo"
  install -Dm644 "./systemd/pasadizo.service" "${pkgdir}/usr/lib/systemd/system/pasadizo.service"
  install -Dm644 "./systemd/pasadizo@.service" "${pkgdir}/usr/lib/systemd/system/pasadizo@.service"
  install -Dm644 "./config.json" "${pkgdir}/etc/pasadizo/config.json"
  install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "./README.md" "${pkgdir}/usr/share/doc/pasadizo/README.md"
}
