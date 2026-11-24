# Maintainer: agony <27015 at riseup dot net>

pkgname=mediafire_rs-bin
pkgver=0.2.3
pkgrel=1
pkgdesc='Downloads files and folders from MediaFire (prebuilt)'
arch=('x86_64')
url='https://github.com/NicKoehler/mediafire_rs'
license=('MIT')
depends=('glibc' 'libgcc' 'openssl-3')
provides=("mediafire_rs=${pkgver}")
conflicts=('mediafire_rs')
source=("mdrs-${pkgver}-LICENSE::https://raw.githubusercontent.com/NicKoehler/mediafire_rs/v${pkgver}/LICENSE")
source_x86_64=("mdrs-${pkgver}-linux-x64.tar.gz::${url}/releases/download/v${pkgver}/mdrs-linux-x64.tar.gz")
sha256sums=('944e7851267d83951e7f2249b633786f93bf6c6e6198efaa30742fc30ee561a2')
sha256sums_x86_64=('3307f025bca4add4ffcc68437b198514dc40a0394bc90b51eddbb4c8e6f7339f')

package() {
  install -Dm755 mdrs-linux-x64/mdrs -t "${pkgdir}/usr/bin"
  install -Dm644 "mdrs-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
