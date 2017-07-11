# Maintainer: Fabio Loli <loli_fabio@protonmail.com>
# https://github.com/FabioLolix

pkgname=polo-donation-plugins
_channel=beta.9
pkgver=17.7.1
pkgrel=1
pkgdesc="Complimentary package for users who have donated to Polo or contributed in other ways such as translations, code changes, etc."
arch=('i686' 'x86_64')
url="http://www.teejeetech.in/"
#license=()
depends=('polo')
provides=('polo-donations-plugins')
conflicts=('polo-donations-plugins')
source_i686=("local://${pkgname}-v${pkgver}-${_channel}-i386.deb") 
source_x86_64=("local://${pkgname}-v${pkgver}-${_channel}-amd64.deb") 
md5sums_i686=('5b3e980d89c36d40d44c2e78d4cf565f')
md5sums_x86_64=('8f46d6ad9dc53d8fd65345f42d836fc9')
#options=(emptydirs)

#prepare() {
#  cd "${srcdir}"
#  tar xzf control.tar.gz
#}

#pkgver() {
#  grep -i "Version" "${srcdir}"/control | cut -d ' ' -f 2
#}

package() {
if [[ "${CARCH}" = 'i686' ]]; then
        bsdtar xf "${pkgname}-v${pkgver}-${_channel}-i386.deb"
    fi
if [[ "${CARCH}" = 'x86_64' ]]; then
        bsdtar xf "${pkgname}-v${pkgver}-${_channel}-amd64.deb"
    fi
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"

#  install -d $pkgdir/usr/bin
#  ln -s /usr/bin/polo-gtk $pkgdir/usr/bin/polo
#  rm $pkgdir/usr/bin/polo-uninstall
}
