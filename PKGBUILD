# Maintainer: Fabio Loli <loli_fabio@protonmail.com>
# https://github.com/FabioLolix

pkgname=quickhash-gui-bin
_pkgname1=QuickHash
_pkgname2=quickhash
pkgver=2.8.2
pkgrel=1
pkgdesc="QuickHash is an open-source Linux GUI that enables hashing of files, text, entire folder trees of files, and physical disks"
arch=('i686' 'x86_64')
url="http://quickhash-gui.org/"
license=('GPL2')
depends=('gtk2')
provides=('quickhash-gui')
conflicts=('quickhash-gui' 'quickhash-gui-bin')
source=("local://${_pkgname1}-v$pkgver-DebianPackages.zip")
md5sums=('de339281c37833f7e0a5f14be248dc56')
package() {
if [[ "${CARCH}" = 'i686' ]]; then
        bsdtar -xf "$_pkgname2"_"$pkgver"-1_i386.deb
    fi
if [[ "${CARCH}" = 'x86_64' ]]; then
        bsdtar -xf "$_pkgname2"_"$pkgver"-1_amd64.deb
    fi
bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
