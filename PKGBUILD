pkgname=update-conf.d
pkgver=20100814
pkgrel=1
pkgdesc='script for flexible /etc/<conf>.d configuration'
arch=('any')
url='https://github.com/Atha/update-conf.d'
license=('GPL')
source=("git+https://github.com/Atha/update-conf.d")
md5sums=("SKIP")
makedepends=("git")

build() {
  cd "${srcdir}/update-conf.d"
  make simple complex
}

package() {
  cd "${srcdir}/update-conf.d"
  make CONFIGDIR="${pkgdir}/etc" INSTALLDIR="${pkgdir}/usr" SBINDIR="${pkgdir}/bin" install
}
