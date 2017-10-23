# Maintainer: Fabio Loli <loli_fabio@protonmail.com>
# https://github.com/FabioLolix

pkgname=polo-donation-plugins
_channel=beta.10
pkgver=17.9.1
pkgrel=1
pkgdesc="Complimentary package for users who have donated to Polo or contributed in other ways such as translations, code changes, etc."
arch=('i686' 'x86_64')
url="http://www.teejeetech.in/"
depends=('polo'
         'youtube-dl'
         'pngcrush'
         'ghostscript'
         'pdftk-bin' )
provides=('polo-donations-plugins')
conflicts=('polo-donations-plugins')
source_i686=("local://${pkgname}-v${pkgver}-${_channel}-i386.deb") 
source_x86_64=("local://${pkgname}-v${pkgver}-${_channel}-amd64.deb") 
md5sums_i686=('c81eac4680726c3b2eba6b716dcf69c3')
md5sums_x86_64=('dc900b17a75ce6734f1d2bf6c3701cdb')

package() {
if [[ "${CARCH}" = 'i686' ]]; then
        bsdtar xf "${pkgname}-v${pkgver}-${_channel}-i386.deb"
    fi
if [[ "${CARCH}" = 'x86_64' ]]; then
        bsdtar xf "${pkgname}-v${pkgver}-${_channel}-amd64.deb"
    fi
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
