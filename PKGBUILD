# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=wmdiskmon
pkgver=0.0.2
pkgrel=6
pkgdesc="A dockapp that monitors your disks usage in a portable way, using the POSIX command df -P."
arch=('i686' 'x86_64')
license=('GPL')
url="http://tnemeth.free.fr/projets/dockapps.html"
depends=('libxpm')
source=("http://tnemeth.free.fr/projets/programmes/$pkgname-$pkgver.tar.gz")
md5sums=('4b02066a58752c3e7100abc0544c2c66')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/share/man/man1/"
  make prefix="${pkgdir}/usr" mandir="${pkgdir}/usr/share/man" install
}
