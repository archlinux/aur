# Maintainer: cookie <coookieuniverse@gmail.com>
pkgname=staruml
pkgver=8.0.0
pkgrel=2
pkgdesc="A sophisticated software modeler"
arch=('x86_64')
url="http://staruml.io/"
license=('custom:staruml')
depends=('libxss' 'libxtst' 'nss' 'alsa-lib' 'gtk2')
source=("$pkgname-${pkgver}_amd64.deb::https://staruml.io/api/download/releases-v8/${pkgname}_${pkgver}_amd64.deb")
sha256sums=('9f496dd1e395a0f75f2ae347ff0510695dc1eae58d1c83cb6a3f990ebfd44017')

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
