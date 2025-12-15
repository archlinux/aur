# Maintainer Bryson Kelly <bryson.dev2011@gmail.com>

pkgname=fat32format
pkgver=2.0.0
pkgrel=1
pkgdesc="Format USB drives as FAT32 regardless of size"
arch=('x86_64')
url="https://github.com/Germ-99/Fat32Format"
license=('GPL2')
depends=('glibc' 'linux-headers')
makedepends=('gcc' 'make')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Germ-99/Fat32Format/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ef248f95e572afc88cdfa25f3de5fb28c48f49ee3b4f32df26829c5addfa0e18')

build() {
    cd "${srcdir}/Fat32Format-${pkgver}"
    make
}

package() {
    cd "${srcdir}/Fat32Format-${pkgver}"
    install -Dm755 fttf "${pkgdir}/usr/bin/fttf"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}