# Maintainer: steelstrings <steelstring.of.a{at}gmail{dot}com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz{at}gmail{dot}com>

pkgname=f21-backgrounds
pkgver=21.1.0
pkgrel=12
_rhver=${pkgver}-15.fc37
pkgdesc="Fedora 21 backgrounds"
arch=('any')
url="https://fedoraproject.org/wiki/F21_Artwork"
license=('CC-BY' 'CC-BY-SA')
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/f/${pkgname}-${_rhver}.src.rpm")
sha256sums=('fa209abb9825423f528c6c8154a7da4217c6df5cae4b5cc0e333c9f7db0f1fd5')

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
