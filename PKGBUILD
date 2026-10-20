# Maintainer: Erdener Karacan <erdener.karacan@gmail.com>
# Önceki Maintainer: Mete ÇİFTÇİ <e.meteciftci@gmail.com>

pkgname=arksigner-pub
pkgver=3.0.12
_debver="${pkgver}_pardus25.11"
pkgrel=1
pkgdesc="ArkSigner e-İmza, Yönetim ve Tarayıcı Uzantısı Uygulaması"
arch=('x86_64')
url="https://www.arksigner.com"
license=('custom')
provides=('arksigner')
conflicts=('arksigner')

depends=(
    'pcsclite'
    'ccid'
    'nss'
    'qt5-base'
    'qt5-svg'
    'poppler-qt5'
    'qpdf'
    'curl'
    'openssl'
    'zlib'
    'python'
)
install="arksigner-pub.install"

source=("https://downloadark.com/arksigner_${_debver}_amd64.deb")
sha256sums=('010ae99b2e99ad718698abd5ae4fff5004f4433674b1cd9ce17e2c565308982e')

package() {
    cd "${srcdir}"
    bsdtar --no-same-owner -xf data.tar.* -C "${pkgdir}"

    # İzinleri standartlaştır
    chmod -R u=rwX,go=rX "${pkgdir}"
    chmod 755 "${pkgdir}/usr/lib/arksigner/truststore"
}
