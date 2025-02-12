# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Thomas Roos (Roosted7) <mail [at] thomasroos [dot] nl>

pkgname=aliza
pkgver=2.7.3
pkgrel=1
pkgdesc="Medical Imaging. Open 2D, 3D and 4D images in DICOM, MetaIO, Nifti, Nrrd and other formats, incl. THIS PACKAGE REQUIRES PAID LICENSE!"
arch=('x86_64')
url="http://www.aliza-dicom-viewer.com"
license=('custom')
depends=('hicolor-icon-theme'
         'libxt'
         'libglvnd')
options=('!emptydirs')
source=("https://www.aliza-medical-imaging.de/aliza_${pkgver}.1_amd64.deb"
        "aliza.desktop")
sha512sums=('36a8031d31f5f6bceb89b2c3b2cf0d4837f9fcd8ef5d1b01177a188cecafd2273416e2cf13d5597460b016af93ae9bccf41ca4f2f04e79aab9e12beaa7b75411'
            'b17f64ef917e3a85fa846f57285de427a9b61baaba204172a617b6b7ef0c6a7e2c242628b80356df8245603720e95331f7de048b097acc4d09e08ece304a36a3')

prepare() {
  tar xf data.tar.xz
}

package() {
    find "${pkgdir}" -type d -exec chmod 750 {} \;
    
    mkdir -p "${pkgdir}${ALIZA_DIR}"
    cp -r "usr/" "${pkgdir}"
}
