# Maintainer: Takuro Onoue <kusanaginoturugi at gmail.com>
pkgname=bitzeny
pkgver=1.1.0
pkgrel=1
pkgdesc="Wallet and minor of cryptcurrency"
arch=('x86_64')
url="http://bitzeny.org/"
license=('MIT')
source=("http://bitzeny.org/bin/${pkgver}/${pkgname}-${pkgver}-linux.tar.gz")
md5sums=('b84616f360902856f2858359984996f7')

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/bin/"
  install -Dm755 ${srcdir}/${pkgname}-${pkgver}-linux/bin/64/* ${pkgdir}/usr/bin/

  cd ${pkgname}-${pkgver}-linux/src
  tar xvfz ${pkgname}-${pkgver}.tar.gz
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  sed -n '/License/,/ Bernard./p' bitzeny-1.1.0/doc/README.md > ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
