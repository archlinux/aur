_pkgname=vision-browser

pkgname="${_pkgname}"
pkgver=3.3.33
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
source_x86_64=("${_debfile}::https://vision-releases.s3.eu-north-1.amazonaws.com/v3.3.33/linux-deb/vision_3.3.33_amd64.deb")
noextract=("${_debfile}")
sha256sums_x86_64=('231ba587ccb17a564828b145a54b3e6447bdf77dc0328b9d44955082deee22d2')

package() {
    cd "$srcdir"
    ar x "${_debfile}"
    tar -xvf data.tar.* -C "$pkgdir/"
}
