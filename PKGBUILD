# Maintainer: Mikael Blomstrand <mbloms@kth.se>
# Contributor: Jérôme M. Berger <jerome.berger@sagemcom.com>

pkgname=abi-compliance-checker
pkgver=2.3
pkgrel=1
pkgdesc="Check ABI compatibility between library versions"
arch=('i686' 'x86_64')
url="https://lvc.github.io/abi-compliance-checker/"
license=('LGPL')
depends=(gcc binutils perl)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/lvc/abi-compliance-checker/archive/${pkgver}.tar.gz)
sha256sums=('b1e32a484211ec05d7f265ab4d2c1c52dcdb610708cb3f74d8aaeb7fe9685d64')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr"
  perl Makefile.pl -install --prefix=/usr --destdir="${pkgdir}"
}
