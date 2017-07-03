# Maintainer: Fabio Loli <loli_fabio@protonmail.com>
# https://github.com/FabioLolix

pkgname=polo-donation-plugins
_betaver=beta.8
pkgver=17.7
pkgrel=1
pkgdesc="Complimentary package for users who have donated to Polo or contributed in other ways such as translations, code changes, etc."
arch=('i686' 'x86_64')
url="http://www.teejeetech.in/"
license=('GPL2')
depends=('polo')
provides=('polo-donations-plugins')
conflicts=('polo-donations-plugins')
source_i686=("local://"$pkgname"-v${pkgver}-"$_betaver"-i386.deb") 
source_x86_64=("local://"$pkgname"-v${pkgver}-"$_betaver"-amd64.deb") 
md5sums_i686=('61df636b4dc16f3196cf54d519f31d6a')
md5sums_x86_64=('5133b8020b51e1b2d4154fd3f4f2d328')

prepare() {
  cd "${srcdir}"
  tar xzf control.tar.gz
}

pkgver() {
  grep -i "Version" "${srcdir}"/control | cut -d ' ' -f 2
}

package() {
if [[ "${CARCH}" = 'i686' ]]; then
        bsdtar -xf "$pkgname"-v${pkgver}-"$_betaver"-i386.deb
    fi
if [[ "${CARCH}" = 'x86_64' ]]; then
        bsdtar -xf "$pkgname"-v${pkgver}-"$_betaver"-amd64.deb
    fi
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
