# Maintainer: Fabio Loli <loli_fabio@protonmail.com>
# https://github.com/FabioLolix

pkgname=polo-donation-plugins
_channel=beta.10
pkgver=18.2
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
source_i686=("local://${pkgname}-v${pkgver}-i386.deb") 
source_x86_64=("local://${pkgname}-v${pkgver}-amd64.deb") 
md5sums_i686=('648e3e55a3c8fc5f02559814683ce461')
md5sums_x86_64=('f471ffeace0aa90368e68f8fbdcb9684')

package() {
if [[ "${CARCH}" = 'i686' ]]; then
        bsdtar xf "${pkgname}-v${pkgver}-i386.deb"
    fi
if [[ "${CARCH}" = 'x86_64' ]]; then
        bsdtar xf "${pkgname}-v${pkgver}-amd64.deb"
    fi
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
