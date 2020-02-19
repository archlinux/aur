# Maintainer: steelstrings <steelstring.of.a{at}gmail{dot}com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz{at}gmail{dot}com>

pkgname=f21-backgrounds
pkgver=21.1.0
pkgrel=8
_rhver=${pkgver}-10.fc32
pkgdesc="Fedora 21 backgrounds"
arch=('any')
url="https://fedoraproject.org/wiki/F21_Artwork"
license=('CC-BY' 'CC-BY-SA')
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/f/${pkgname}-${_rhver}.src.rpm")
sha256sums=('60f4b897111924eba8c47d8fc8d8c693dc2c4056aa8573db79e3f46e0009cdae')

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
