# Maintainer: agony <27015 at riseup dot net>

pkgname=kiota-bin
pkgver=1.39.0
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
sha256sums_x86_64=('1b8fd9de072113772788328bff9f60a2b4a736e799b88dcda6f0b52fc9c5f07a')
sha256sums_aarch64=('da8a151fae880cc51c375c79a04e6848c63149b0f055777f9e67f7947eb89487')

package() {
  install -Dm755 kiota -t "${pkgdir}/usr/lib/kiota"
  install -Dm644 appsettings.json -t "${pkgdir}/usr/lib/kiota"
  install -d "${pkgdir}/usr/bin"
  ln -s /usr/lib/kiota/kiota "${pkgdir}/usr/bin/kiota"
  install -Dm644 "kiota-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
