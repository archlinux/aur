# Maintainer: mavxa

pkgname=vesselix-bin
_pkgname=vesselix
pkgver=0.1.1
pkgrel=1
pkgdesc="Lightweight local-first Docker dashboard"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/mavxa/Vesselix"
license=('MIT')
depends=('docker')
provides=('vesselix')
conflicts=('vesselix' 'vesselix-git')
source=('vesselix.service')
source_x86_64=("${_pkgname}-${pkgver}-linux-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-linux-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-aarch64.tar.gz")
source_armv7h=("${_pkgname}-${pkgver}-linux-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-armv7h.tar.gz")
sha256sums=('26b1ff5ece3a4b0c0b679ab03abaf4080882e91d987ab5b2cb313b62fd745704')
sha256sums_x86_64=('41f3f5ae3aa630f4d9ff6444b7501124e9682062afc3c39bbe7ff3519e2431f5')
sha256sums_aarch64=('158087bf1db1311f488efede7f787e38750ce818251cb00e2f46b65d64f56adb')
sha256sums_armv7h=('4759f935dfca7fcb7677d7c43c48a73222fea5f2cf04cc1eedce8b67e48958dc')

package() {
  install -Dm755 "${srcdir}/vesselix" "${pkgdir}/usr/bin/vesselix"
  install -Dm644 "${srcdir}/vesselix.service" "${pkgdir}/usr/lib/systemd/system/vesselix.service"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/vesselix/README.md"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
