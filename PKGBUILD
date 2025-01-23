# Maintainer: Jonas Leder <info@jonasled.de>
_pkgname=aptakube

pkgname="${_pkgname}"
pkgver=1.10.3
pkgrel=1
pkgdesc="A modern and lightweight Kubernetes desktop client to help you operate workloads on multiple clusters. (free to use during the public preview)"
arch=('x86_64')
url="https://aptakube.com/"
license=('Proprietary')
depends=('zlib' 'hicolor-icon-theme' 'webkit2gtk-4.1')
optdepends=('gnome-terminal')
makedepends=('binutils')
options=(!strip)
_debfile="${pkgname}-${pkgver}.deb"
source_x86_64=("${_debfile}::https://releases.aptakube.com/${_pkgname}_${pkgver}_amd64.deb")
noextract=("${_debfile}")
sha256sums_x86_64=('55f26098a148e62e9d720c6566555ff6d5b8b17f32e0126f361427d9ea18bff8')

package() {
    cd "$srcdir"

    # Extract .deb file
    ar x "${_debfile}"
    tar -xvf data.tar.* -C "$pkgdir/"

}
