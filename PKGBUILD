# Maintainer: Maksymilian Gala <https://github.com/maxidragon>
#
# Template for the scrambles-viewer-bin AUR package. The desktop release workflow
# fills in pkgver and _deb from the release, computes the checksums and pushes the
# result to the AUR; the values below are placeholders and are never published as-is.
pkgname=scrambles-viewer-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="View WCA scramble PDFs at a competition"
arch=('x86_64')
url="https://github.com/maxidragon/scrambles-viewer"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'pango' 'webkit2gtk-4.1')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!strip' '!debug')
_deb='Scrambles.Viewer_0.1.1_amd64.deb'
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/desktop-v${pkgver}/${_deb}"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/maxidragon/scrambles-viewer/desktop-v${pkgver}/LICENSE")
sha256sums=('77c9b55c404a7225b65707a1d74dfdf748284b1c2289a67dadf5d0e5b601269f'
            '2fc937834f80ea37f5291832b6cb1a82c503d9fc299845ecdf1469be60e89d9d')

package() {
  bsdtar -xf data.tar.* -C "${pkgdir}"
  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
