# Maintainer: steelstrings <steelstring.of.a{at}gmail{dot}com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz{at}gmail{dot}com>

pkgname=f21-backgrounds
pkgver=21.1.0
pkgrel=7
_rhver=${pkgver}-9.fc31
pkgdesc="Fedora 21 backgrounds"
arch=('any')
url="https://fedoraproject.org/wiki/Wallpapers#Fedora_21"
license=('CC-BY' 'CC-BY-SA')
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/f/${pkgname}-${_rhver}.src.rpm")
sha256sums=('00d727482b678ece93257786680d2a224d3617b8ecacb57cd82b6799ef0aa522')

prepare()  {
    tar -xvJf ./${pkgname}-${pkgver}.tar.xz
    rm -r ./${pkgname}-${pkgver}.tar.xz
    rm -r ./${pkgname}.spec
}

build() {
    cd ./${pkgname}-${pkgver}
    make
}

package() {
    cd ./${pkgname}-${pkgver}
    make install DESTDIR="${pkgdir}"
}
