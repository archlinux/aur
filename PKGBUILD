# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=anydesk-test
pkgver=2.9.6
pkgrel=1
pkgdesc="'AnyDesk Free' is an All-In-One Software for Remote Support - Playground-Version"
arch=('i686' 'x86_64')
url="http://anydesk.de/"
license=('custom:Freeware')
depends=('fakeroot' 'gtkglext' 'libglvnd' 'gtk2' 'libx11' 'glibc' 'glib2' 'gdk-pixbuf2' 'libxcb' 'cairo' 'pango' 'libxi' 'libxrandr' 'libxtst' 'libxext' 'libxfixes' 'libxdamage' 'gcc-libs')
optdepends=('libpulse')
conflicts=('anydesk')

source_i686=("http://download.anydesk.com/linux/${pkgname}_${pkgver}-1_i386.deb" "https://download.anydesk.com/linux/anydesk-${pkgver}-i686.tar.gz")
source_x86_64=("http://download.anydesk.com/linux/${pkgname}_${pkgver}-1_amd64.deb" "https://download.anydesk.com/linux/anydesk-${pkgver}-amd64.tar.gz")

sha256sums_i686=('7a023315b63ef5ca99011eb7ce718ebd79c42852db5ee67a8f257f617799ff41' '05b9b97f728033e54569b9b9693121e6c36425f6ac187b632b0cd346de27a440')
sha256sums_x86_64=('0ced2e3d26f86a4d9586d38d56f4818bde05c79c317291c1db1503e878c1dc44' '2c89d7a13734a9125d154a40f3809c407649878a17e98f30996845082bf6e6c9')

package() {
    cd "${pkgdir}"
    tar xf "${srcdir}/data.tar.gz"
    install -m755 "${srcdir}/anydesk-${pkgver}/anydesk" "${pkgdir}/usr/bin/anydesk"
    #
    msg2 "\e[1;32mIf you want to enable the autostart mode, edit PKGBUILD and comment line #25 \e[0m"
    rm -rf etc/
}
