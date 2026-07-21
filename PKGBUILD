# Maintainer: Jonas Leder <info@jonasled.de>
_pkgname=aptakube

pkgname="${_pkgname}"
pkgver=1.18.6
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
sha256sums_x86_64=('eca37444907ca810e99c93b814fd64ba1c402df7c93abe5fc4728ed9c59dd0bb')

package() {
    cd "$srcdir"

    # Extract .deb file
    ar x "${_debfile}"
    tar -xvf data.tar.* -C "$pkgdir/"

}
