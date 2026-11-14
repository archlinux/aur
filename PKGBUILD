# Maintainer: cookie <coookieuniverse@gmail.com>
pkgname=staruml
pkgver=8.1.0
pkgrel=1
pkgdesc="A sophisticated software modeler"
arch=('x86_64')
url="http://staruml.io/"
license=('custom:staruml')
depends=('libxss' 'libxtst' 'nss' 'alsa-lib' 'gtk2')
source=("$pkgname-${pkgver}_amd64.deb::https://staruml.io/api/download/releases-v8/${pkgname}_${pkgver}_amd64.deb")
sha256sums=('6af19e4acb444633bbebf902a75507dcd8b9548c87d6424940afa253f039a971')

prepare() {
    # Extract package data
    [ -f "data.tar.xz" ] && bsdtar -xf data.tar.xz
	[ -f "data.tar.zst" ] && bsdtar -xf data.tar.zst
}

package() {
    cd "${srcdir}"
    cp -ra ./opt ./usr "${pkgdir}"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s '/opt/staruml/staruml' "${pkgdir}/usr/bin/staruml"

    #build_desktop_dir="${pkgdir}/usr/share/applications"
    #install -d -m755 "${build_desktop_dir}"
    #install -m644 "${srcdir}/${pkgname}.desktop" "${build_desktop_dir}"
}
