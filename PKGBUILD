_pkgname=vision-browser

pkgname="${_pkgname}"
pkgver=3.3.3
pkgrel=1
pkgdesc="Vision browser is antidetect browser"
arch=('x86_64')
url="https://browser.vision/"
license=('Proprietary')
depends=('xdotool' 'webkit2gtk-4.1')
optdepends=('gnome-terminal')
makedepends=('binutils')
options=(!strip)
_debfile="${pkgname}-${pkgver}.deb"
source_x86_64=("${_debfile}::https://vision-releases.s3.eu-north-1.amazonaws.com/v3.3.3/linux-deb/vision_3.3.3_amd64.deb")
noextract=("${_debfile}")
sha256sums_x86_64=('492fdc1c177af72c64886c5bc142a65d28ffb19cbcebc1eb8db49d1f529616c3')

package() {
    cd "$srcdir"
    ar x "${_debfile}"
    tar -xvf data.tar.* -C "$pkgdir/"
}
