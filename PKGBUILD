# Maintainer: Mikael Blomstrand <mbloms@kth.se>
# Contributor: Jérôme M. Berger <jerome.berger@sagemcom.com>

pkgname=abi-compliance-checker
pkgver=2.2
pkgrel=1
pkgdesc="Check ABI compatibility between library versions"
arch=('i686' 'x86_64')
url="https://lvc.github.io/abi-compliance-checker/"
license=('GPL')
depends=(gcc binutils perl)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/lvc/abi-compliance-checker/archive/${pkgver}.tar.gz)
sha256sums=('9fb7b17e33d49e301d02a6374fbd2596feb53ecc77194879a4e1c2d1e24b4ddb')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr"
  perl Makefile.pl -install --prefix=/usr --destdir="${pkgdir}"
}
