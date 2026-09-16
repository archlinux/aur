# Maintainer: Jonas Leder <info@jonasled.de>
_pkgname=aptakube

pkgname="${_pkgname}"
pkgver=1.20.4
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
sha256sums_x86_64=('1c36d15933455f65749207852193cb34b453471c7f7844d08b22c3d587fa6188')

package() {
    cd "$srcdir"

    # Extract .deb file
    ar x "${_debfile}"
    tar -xvf data.tar.* -C "$pkgdir/"

}
