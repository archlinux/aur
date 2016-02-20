# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Contributor: Sam G Nazarko <email at samnazarko dot co dot uk>
# Contributor: Luigi Ranghetti <ggranga at gmail dot com>
 
pkgname="osmc-installer-bin"
pkgver="1.2.5"
pkgrel="1"
pkgdesc="OSMC Installer allows you to install OSMC on a variety of devices."
url="http://osmc.tv"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gksu' 'glibc' 'gcc' 'qt4' 'gcc-libs' 'zlib')
provides=('osmc-installer')

source_i686=("http://download.opensuse.org/repositories/home:/osmc/Debian_8.0/i386/osmc-installer_${pkgver//./}_i386.deb")
source_x86_64=("http://download.opensuse.org/repositories/home:/osmc/Debian_8.0/amd64/osmc-installer_${pkgver//./}_amd64.deb")
sha256sums_i686=('2267ad29b31469f7f66206d03e0689360fe8f7382378fa207f06ea7284dbc80c')
sha256sums_x86_64=('afab8516164d9b093dc89700b0d7cf894f68ae579e91d9af279ea9152dd0eebc')
 
package() {
    cd "${srcdir}"
    ar p *.deb data.tar.xz | tar xJ -C "${pkgdir}" ./usr

    cd "${pkgdir}"
    rm -rf ./usr/share/doc
}
 
# vim:set ts=4 sw=2 ft=sh et: