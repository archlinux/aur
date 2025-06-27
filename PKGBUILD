_pkgname=vision-browser

pkgname="${_pkgname}"
pkgver=3.3.2
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
source_x86_64=("${_debfile}::https://vision-releases.s3.eu-north-1.amazonaws.com/v3.3.2/linux-deb/vision_3.3.2_amd64.deb")
noextract=("${_debfile}")
sha256sums_x86_64=('918bca757447b6846ccca4bb4f8647294019193e2cbe89d15ad72e7b00ab041e')

package() {
    cd "$srcdir"
    ar x "${_debfile}"
    tar -xvf data.tar.* -C "$pkgdir/"
}
