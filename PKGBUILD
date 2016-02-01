# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Contributor: Sam G Nazarko <email at samnazarko dot co dot uk>
# Contributor: Luigi Ranghetti <ggranga at gmail dot com>
 
pkgname="osmc-installer-bin"
pkgver="1.2.4"
pkgrel="1"
pkgdesc="OSMC Installer allows you to install OSMC on a variety of devices."
url="http://osmc.tv"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc' 'gcc' 'qt4' 'gcc-libs' 'zlib')
provides=('osmc-installer')

source_i686=("http://download.opensuse.org/repositories/home:/osmc/Debian_8.0/i386/osmc-installer_${pkgver//./}_i386.deb")
source_x86_64=("http://download.opensuse.org/repositories/home:/osmc/Debian_8.0/amd64/osmc-installer_${pkgver//./}_amd64.deb")
sha256sums_i686=('9a99f6555be7627de0923cd4f1e110dd4b81e3a9da75e1c5aca3154c6d059770')
sha256sums_x86_64=('2284107a464bbb5eb470c235b48941a673ee39066edfc747c1a2b019993ea705')
 
package() {
    cd "${srcdir}"
    ar p *.deb data.tar.xz | tar xJ -C "${pkgdir}" ./usr

    cd "${pkgdir}"
    rm -rf ./usr/share/doc
}
 
# vim:set ts=4 sw=2 ft=sh et:
