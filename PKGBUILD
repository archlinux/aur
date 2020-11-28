# Maintainer: steelstrings <steelstring.of.a{at}gmail{dot}com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz{at}gmail{dot}com>

pkgname=f21-backgrounds
pkgver=21.1.0
pkgrel=9
_rhver=${pkgver}-11.fc33
pkgdesc="Fedora 21 backgrounds"
arch=('any')
url="https://fedoraproject.org/wiki/F21_Artwork"
license=('CC-BY' 'CC-BY-SA')
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/f/${pkgname}-${_rhver}.src.rpm")
sha256sums=('574508db1b6507fa070aebb9692bbd808689abd8dd84d7a3641c7fd8a85e0dbc')

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
