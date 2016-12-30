# Maintainer: Renaud Littolff <rlittolff@gmail.com>

pkgname=mongobooster
_shortpkgver=3.2
pkgver=3.2.2
pkgrel=1
pkgdesc="The Smartest MongoDB Admin GUI"
arch=('x86_64')
url="http://mongobooster.com"
options=('!strip' '!upx')
depends=('nss' 'libxtst' 'gcc-libs-multilib' 'alsa-lib' 'gconf' 'gtk2')

source_x86_64=("https://s3.amazonaws.com/mongobooster/download/${_shortpkgver}/mongobooster-${pkgver}-amd64.deb")
md5sums_x86_64=('32d2006f41b069b5efa53ab6da495943')

package() {
    cd "${srcdir}"

    tar -xf data.tar.xz -C "${pkgdir}"

    install -d "${pkgdir}"/usr/share/applications
    install -d "${pkgdir}"/usr/share/icons
    install -d "${pkgdir}"/opt/mongobooster

    chmod -R go-w "${pkgdir}"/usr
}
