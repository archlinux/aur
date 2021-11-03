# Maintainer: RichieMay

pkgname=microsoft-edge-stable
pkgver=95.0.1020.40
pkgrel=1
pkgdesc="Microsoft Edge Web Browser"
arch=(x86_64)
options=(!strip)
url='https://www.microsoft.com/edge/'
license=('GPL3')
depends=('ca-certificates' 'gtk3' 'libcups' 'nss' 'alsa-lib' 'libxss' 'libxtst' 'ttf-liberation')
source=("microsoft-edge-stable_${pkgver}-${pkgrel}_amd64.deb::https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-stable/microsoft-edge-stable_${pkgver}-${pkgrel}_amd64.deb")

sha256sums=('c5d4965c2216803874bca1b03a354b887e1a468d3a494462f24eb1c7efc4c66a')

package() {
    cd ${srcdir}

    tar -xJvf data.tar.xz -C "${pkgdir}"

    for size in 16 24 32 48 64 128 256 ; do
        install -D "$pkgdir/opt/microsoft/msedge/product_logo_${size}.png" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/microsoft-edge.png"
    done
}
