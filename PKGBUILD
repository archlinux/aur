# Maintainer: agony <27015 at riseup dot net>

pkgname=kiota-bin
pkgver=1.38.0
pkgrel=1
pkgdesc='OpenAPI based HTTP client code generator (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/microsoft/kiota'
license=('MIT')
depends=('glibc' 'icu' 'libgcc' 'libstdc++' 'openssl')
optdepends=('krb5: Kerberos and Negotiate HTTP authentication')
provides=("kiota=${pkgver}")
conflicts=('kiota')
options=('!strip' '!debug')
install=kiota.install
_release="${url}/releases/download/v${pkgver}"
source=("kiota-${pkgver}-LICENSE::https://raw.githubusercontent.com/microsoft/kiota/v${pkgver}/LICENSE")
source_x86_64=("kiota-${pkgver}-x86_64.zip::${_release}/linux-x64.zip")
source_aarch64=("kiota-${pkgver}-aarch64.zip::${_release}/linux-arm64.zip")
sha256sums=('c2cfccb812fe482101a8f04597dfc5a9991a6b2748266c47ac91b6a5aae15383')
sha256sums_x86_64=('aca484531cd4aaeec1aa751f3cad6a0e1b5709260035c7955f1ee8e6b7615f5a')
sha256sums_aarch64=('c517a102b5203eee62aacf58f0baeefa6a828be62e7261a112e1d3c9b7dcaff1')

package() {
  install -Dm755 kiota -t "${pkgdir}/usr/lib/kiota"
  install -Dm644 appsettings.json -t "${pkgdir}/usr/lib/kiota"
  install -d "${pkgdir}/usr/bin"
  ln -s /usr/lib/kiota/kiota "${pkgdir}/usr/bin/kiota"
  install -Dm644 "kiota-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
