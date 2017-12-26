# Maintainer: Takuro Onoue <kusanaginoturugi at gmail.com>
pkgname=bitzeny
pkgver=1.2.1
pkgrel=1
pkgdesc="Wallet of cryptocurrency"
arch=('x86_64')
url="https://github.com/BitzenyCoreDevelopers/bitzeny"
license=('MIT')
source=("https://github.com/BitzenyCoreDevelopers/${pkgname}/releases/download/z${pkgver}/${pkgname}-${pkgver}-linux.tar.gz")
md5sums=('e2e4d0659a48ad21ef579b1c2ed7a852')

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/bin/"
  install -Dm755 ${srcdir}/${pkgname}-${pkgver}-linux/bin/64/* ${pkgdir}/usr/bin/

  cd ${pkgname}-${pkgver}-linux/src
  tar xvfz ${pkgname}-${pkgver}.tar.gz
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  sed -n '/License/,/ Bernard./p' ${pkgname}-${pkgver}/doc/README.md > ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
