# Maintainer: Mikael Blomstrand <mbloms ÅT kth DÖT se>
# Contributor: Jérôme M. Berger <jerome.berger@sagemcom.com>

pkgname=abi-compliance-checker
pkgver=2.3
pkgrel=2
pkgdesc="Check ABI compatibility between library versions"
arch=('i686' 'x86_64')
url="https://lvc.github.io/abi-compliance-checker/"
license=('LGPL')
depends=('gcc' 'binutils' 'perl' 'ctags' 'abi-dumper>=1.1')
conflicts=('ccache<3.1.2')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/lvc/${pkgname}/archive/${pkgver}.tar.gz)
md5sums=('7234921acc9dabee1d1cb6a5ac43c4be')
sha1sums=('f4f16cc58f599079baaed7c5647a4df9fc4da197')
sha256sums=('b1e32a484211ec05d7f265ab4d2c1c52dcdb610708cb3f74d8aaeb7fe9685d64')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr"
  perl Makefile.pl -install --prefix=/usr --destdir="${pkgdir}"
}
