# Maintainer: PQCraft <0456523@gmail.com>

pkgname=cavecube-bin
ghpkgname=CaveCube
pkgver=0.1.0
pkgrel=1
pkgdesc="An in-development Minecraft/Infiniminer clone"
arch=(x86_64)
url="https://github.com/PQCraft/${ghpkgname}"
license=(Boost)
depends=('glibc' 'glfw')
provides=(cavecube)
conflicts=(cavecube)
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/PQCraft/${ghpkgname}/releases/download/${pkgver}/cavecube-linux.tar.gz" "${pkgname}-data-${pkgver}-${pkgrel}.zip::https://github.com/PQCraft/${ghpkgname}/releases/download/${pkgver}/cavecube-data.zip")
sha256sums=('SKIP' 'SKIP')

package() {
    cd "${srcdir}"
    find cavecube docs/ resources/ -type f -exec install -Dm 755 "{}" "${pkgdir}/opt/${ghpkgname}/{}" \;
    mkdir -p "${pkgdir}/usr/bin/"
    ln -sf "/opt/${ghpkgname}/cavecube" "${pkgdir}/usr/bin/cavecube"
    rm -f cavecube.lnk
}
