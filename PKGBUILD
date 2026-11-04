# Maintainer: cookie <coookieuniverse@gmail.com>
pkgname=staruml
pkgver=8.0.1
pkgrel=1
pkgdesc="A sophisticated software modeler"
arch=('x86_64')
url="http://staruml.io/"
license=('custom:staruml')
depends=('libxss' 'libxtst' 'nss' 'alsa-lib' 'gtk2')
source=("$pkgname-${pkgver}_amd64.deb::https://staruml.io/api/download/releases-v8/${pkgname}_${pkgver}_amd64.deb")
sha256sums=('9092a9664da1c93e2b91ad3718912231a89a21f2393be5a681a043b872f0ff97')

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
}
