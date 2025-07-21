_pkgname=vision-browser

pkgname="${_pkgname}"
pkgver=3.3.7
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
source_x86_64=("${_debfile}::https://vision-releases.s3.eu-north-1.amazonaws.com/v3.3.7/linux-deb/vision_3.3.7_amd64.deb")
noextract=("${_debfile}")
sha256sums_x86_64=('5e8a62ba9f4b98d9fb83c09ac6fbdfab4ee6268f4cb8cc8d699f613ce1cc9bf4')

package() {
    cd "$srcdir"
    ar x "${_debfile}"
    tar -xvf data.tar.* -C "$pkgdir/"
}
