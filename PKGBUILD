# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Contributor: Sam G Nazarko <email at samnazarko dot co dot uk>
# Contributor: Luigi Ranghetti <ggranga at gmail dot com>
 
pkgname="osmc-installer-bin"
pkgver="1.2.1"
pkgrel="1"
pkgdesc="OSMC Installer allows you to install OSMC on a variety of devices."
url="http://osmc.tv"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc' 'gcc' 'qt4' 'gcc-libs' 'zlib')
provides=('osmc-installer')

source_i686=("http://download.opensuse.org/repositories/home:/osmc/Debian_8.0/i386/osmc-installer_${pkgver//./}_i386.deb")
source_x86_64=("http://download.opensuse.org/repositories/home:/osmc/Debian_8.0/amd64/osmc-installer_${pkgver//./}_amd64.deb")
sha256sums_i686=('10744734a796a94155e6ec6dcf5036d85d31e47922743bcb4ba8073ed8a170ff')
sha256sums_x86_64=('a632e26f984326f3ee78cb5e77ec6d8ae38bcc4b6b258656e2eaef9bc73f6dcd')
 
package() {
    cd "${srcdir}"
    ar p *.deb data.tar.xz | tar xJ -C "${pkgdir}" ./usr

    cd "${pkgdir}"
    rm -rf ./usr/share/doc
}
 
# vim:set ts=4 sw=2 ft=sh et:
