# Maintainer: Afdsfaj <addart0845@outlook.com>
# Contributor: swweetp <swweetp@outlook.com>
# Contributor: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>
# Contributor: Fabien Devaux <fdev31@gmail.com>

pkgname=ideamaker
pkgver=5.3.2
_pkgverminor=8640
pkgrel=1
pkgdesc="Fast and user friendly 3D slicer for FDM printers"
arch=('x86_64')
url="https://www.raise3d.com/pages/ideamaker"
license=('custom')
depends=('mesa-libgl' 'desktop-file-utils' 'libxcrypt-compat')
makedepends=()
source_x86_64=("https://downcdn.raise3d.com/ideamaker/release/${pkgver}/ideaMaker_${pkgver}.${_pkgverminor}-ubuntu_amd64.deb")
sha256sums_x86_64=('59988618d849e61fe4c74c20bee479cbc07387bd30eaedfa96503d3883f851fe')

package() {
    tar xf "$srcdir/data.tar.xz" -C "${pkgdir}"
    mkdir -p "${pkgdir}/usr/bin"
    ln -fs "/usr/lib/x86_64-linux-gnu/ideamaker/ideamaker-start.sh" "${pkgdir}/usr/bin/ideamaker"
    install -Dm644 "${pkgdir}/usr/share/ideamaker/License.rtf" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
