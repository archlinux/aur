# Maintainer: Miguel Revilla <yo@miguelrevilla.com>

pkgname=crackpkcs12
pkgver=0.2.10
pkgrel=1
pkgdesc="A tool to audit PKCS12 files passwords"
arch=('i686' 'x86_64')
depends=('openssl')
url="http://crackpkcs12.sourceforge.net"
license=('GPL')
source=("http://download.sourceforge.net/project/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('fbb84226b13b1d4903a8aa4f29e7062f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}"
  install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
