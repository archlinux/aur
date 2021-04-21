# Maintainer: Benjamin Stürz <benni@stuerz.xyz>
pkgname=fuse-tar-mounter
pkgver=1.0
pkgrel=4
pkgdesc="A simple tar-archive FUSE mounter"
arch=(any)
url="https://github.com/Benni3D/fuse-tar"
source=("https://github.com/Benni3D/fuse-tar/archive/v${pkgver}.tar.gz")
license=('MIT')
depends=('zenity')
md5sums=('768ae8c93fe8b0a2bdcc6c8d02b35529')

build() {
   cd "${srcdir}/fuse-tar-${pkgver}"
   make -j$(nproc)
}

package() {
   cd "${srcdir}/fuse-tar-${pkgver}"
   install -Dm755 "fuse_tar" "${pkgdir}/usr/bin/fuse_tar"
   install -Dm755 "src/tar-mounter.sh" "${pkgdir}/usr/bin/tar-mounter"
   install -Dm644 "src/tar-mounter.desktop" "${pkgdir}/usr/share/applications/tar-mounter.desktop"
   install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
   install -Dm644 "README.MD" "${pkgdir}/usr/share/doc/${pkgname}/README.MD"
}

