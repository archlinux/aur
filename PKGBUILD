# Maintainer: Qualeko qualeko@protonmail.com
pkgname=seanime-bin
pkgver=1.2.0
pkgrel=2
pkgdesc="A self-hosted server that seamlessly integrates with your local anime collection with anilist integration."
arch=(x86_64)
url="https://github.com/5rahim/seanime"
license=('MIT')
conflicts=()
depends=()
source=("https://github.com/5rahim/seanime/releases/download/v${pkgver}/seanime-${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('d2dfdaa750a8cebd360278a28fe0b306aca84d251fe475f34a529b9fec5d19fc')

prepare() {
    sed -i 's/$SEANIME_WORKING_DIR\/web/\/opt\/seanime-bin\/\/\/\/\/web/' "${srcdir}/seanime"
}

package() {
    install -d "${pkgdir}/usr/bin/"
    install -dm755 "${pkgdir}/opt/${pkgname}"
    install -m 755 "${srcdir}/seanime" -t "${pkgdir}/opt/${pkgname}/"
    cp -r "${srcdir}/web" "${pkgdir}/opt/${pkgname}/"
    ln -s "/opt/${pkgname}/seanime" "${pkgdir}/usr/bin/"
}
