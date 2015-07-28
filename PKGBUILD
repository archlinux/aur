# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Contributor: Sam G Nazarko <email at samnazarko dot co dot uk>
# Contributor: Luigi Ranghetti <ggranga at gmail dot com>
 
pkgname="osmc-installer-bin"
pkgver="1.1.1"
pkgrel="2"
pkgdesc="OSMC Installer allows you to install OSMC on a variety of devices."
url="http://osmc.tv"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc' 'gcc' 'qt4' 'gcc-libs' 'zlib')
provides=('osmc-installer')

source_i686=("http://download.opensuse.org/repositories/home:/osmc/Debian_8.0/i386/osmc-installer_${pkgver//./}_i386.deb")
source_x86_64=("http://download.opensuse.org/repositories/home:/osmc/Debian_8.0/amd64/osmc-installer_${pkgver//./}_amd64.deb")
sha256sums_i686=('929e916b7f0c3188c5c4ba6e9481ae798672c1bd979d2629c09c649135afe910')
sha256sums_x86_64=('78a36059d9410615e02f7e35e5da8c35512c63e2ceeb37b0db5e965996e7006c')
 
package() {
    cd "${srcdir}"
    ar p *.deb data.tar.gz | tar zx -C "${pkgdir}" ./usr

    cd "${pkgdir}"
    rm -rf ./usr/share/doc
}
 
# vim:set ts=4 sw=2 ft=sh et:
