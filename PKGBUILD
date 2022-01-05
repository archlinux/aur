# Maintainer: Osman Karagöz <osmank3[at]gmail[dot]com>
# Maintainer: Can Celasun <dcelasun[at]gmail[dot]com>

pkgname=akia
pkgver=6.2.1
pkgrel=1
pkgdesc="PKCS#11 library and utility tools for Akis Smartcard"
arch=('x86_64')
url="https://akiskart.bilgem.tubitak.gov.tr/"
license=('custom')
depends=('pcsclite' 'ccid' 'java-environment')
install=akia.install
source=(akia.patch
        https://akiskart.bilgem.tubitak.gov.tr/dosyalar/akis_${pkgver}_amd64.rar)  
sha256sums=('180d9fe95b6c94d6e4377701bd1bdf116e722d5baedbd57b509b0c12339dc503'
            '2e1fb8f8b176e3e674ec72e3f0394abc1de95a5d044e610ddf8255709c13f20a')

prepare() {
  ar x akis_${pkgver}_amd64.deb
  tar -zxf data.tar.gz -C "${srcdir}"
  patch --forward --strip=1 --input="akia.patch"
}

package() {
  mv "${srcdir}"/usr "${pkgdir}"/usr
}
