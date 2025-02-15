# Maintainer: Igor Kulkov <xp.jfk9w@gmail.com>

pkgname=transmissionic-web-ui-bin
pkgver=1.8.0
pkgrel=1
pkgdesc='Web UI for Transmission'
arch=(any)
url='https://github.com/6c65726f79/Transmissionic'
license=('MIT')
depends=('transmission-cli')
source=("https://github.com/6c65726f79/Transmissionic/releases/download/v${pkgver}/Transmissionic-webui-v${pkgver}.zip"
        "https://raw.githubusercontent.com/6c65726f79/Transmissionic/refs/tags/v${pkgver}/LICENSE"
        'transmissionic-web-ui.conf')
sha256sums=('2216c90aff525a32eca4962fe9d04aae8a0693ebc0eecab53775b33277ba3c4c'
            '61a59d5ee8c459b5171700485c769d9efb67bf00cb2be4b6fe5561dcdef10191'
            'd5578ed8999aefb4203775bdc2a4327c1d1120c176e78bedbcf6ecb577525898')

package() {
    cd "${srcdir}"
    install -d "${pkgdir}/usr/share/transmissionic"
    cp -a web/ "${pkgdir}/usr/share/transmissionic"
    install -Dm644 transmissionic-web-ui.conf -t "${pkgdir}/etc/systemd/system/transmission.service.d"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
