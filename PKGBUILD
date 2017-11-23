# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=f27-backgrounds
_pkgname=fedora-workstation-backgrounds
pkgver=27.2
pkgrel=1
_rhver="2.fc27"
pkgdesc="Fedora 26 backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/F27_Artwork"
license=("CC-BY-SA")
source=("https://kojipkgs.fedoraproject.org//packages/fedora-workstation-backgrounds/1.1/${_rhver}/src/fedora-workstation-backgrounds-1.1-${_rhver}.src.rpm")
sha256sums=('156de39b8ef6c05465fcf96d2c42031da9bf084c004303258cc4ddf2db590aa4')

prepare()  {
    tar -xf ./${_pkgname}-1.1.tar.gz
    rm -r ./${_pkgname}-1.1.tar.gz
    rm -r ./${_pkgname}.spec
}

build() {
    cd ./${_pkgname}-1.1
    ./configure --prefix=/usr
    make
}

package() {    
    cd ./${_pkgname}-1.1
    make install DESTDIR="${pkgdir}"
    mv ${pkgdir}/usr/share/backgrounds/fedora-workstation ${pkgdir}/usr/share/backgrounds/f27-backgrounds
}
