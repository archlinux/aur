# Maintainer: Jonas Leder <info@jonasled.de>
_pkgname=aptakube

pkgname="${_pkgname}"
pkgver=1.18.8
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
sha256sums_x86_64=('268a02fdfc32d73688536500983a287a311b066082855ac9dab4ec9f433c59a2')

package() {
    cd "$srcdir"

    # Extract .deb file
    ar x "${_debfile}"
    tar -xvf data.tar.* -C "$pkgdir/"

}
