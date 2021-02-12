# Maintainer: steelstrings <steelstring.of.a{at}gmail{dot}com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz{at}gmail{dot}com>

pkgname=f21-backgrounds
pkgver=21.1.0
pkgrel=10
_rhver=${pkgver}-12.fc34
pkgdesc="Fedora 21 backgrounds"
arch=('any')
url="https://fedoraproject.org/wiki/F21_Artwork"
license=('CC-BY' 'CC-BY-SA')
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/f/${pkgname}-${_rhver}.src.rpm")
sha256sums=('410b14d59c6ed42aecd7732f1806979c6a7a5309bbad2fb172442bbda24b8c38')

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
