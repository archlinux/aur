# Maintainer: Renaud Littolff <rlittolff@gmail.com>

pkgname=mongobooster
_shortpkgver=3.2
pkgver=3.2.1
pkgrel=1
pkgdesc="The Smartest MongoDB Admin GUI"
arch=('x86_64')
url="http://mongobooster.com"
options=('!strip' '!upx')
depends=('nss' 'libxtst' 'gcc-libs-multilib' 'alsa-lib' 'gconf' 'gtk2')

source_x86_64=("https://s3.amazonaws.com/mongobooster/download/${_shortpkgver}/mongobooster-${pkgver}-amd64.deb")
md5sums_x86_64=('52ef217c9cae0a66bc7d215ec7d12b0c')

package() {
    cd "${srcdir}"

    tar -xf data.tar.xz -C "${pkgdir}"

    install -d "${pkgdir}"/usr/share/applications
    install -d "${pkgdir}"/usr/share/icons
    install -d "${pkgdir}"/opt/mongobooster

    chmod -R go-w "${pkgdir}"/usr
}
