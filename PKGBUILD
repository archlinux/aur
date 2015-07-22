pkgname=update-conf.d
pkgver=20100814
pkgrel=2
pkgdesc='script for flexible /etc/<conf>.d configuration'
arch=('any')
url='https://github.com/Atha/update-conf.d'
license=('GPL')
source=("git+https://github.com/Atha/update-conf.d")
md5sums=("SKIP")
makedepends=("git")
backup=("etc/update-conf.d.conf")

build() {
  cd "${srcdir}/update-conf.d"
  make simple complex
}

package() {
  cd "${srcdir}/update-conf.d"

  mkdir "${pkgdir}/etc/"
  touch "${pkgdir}/etc/update-conf.d.conf"
  chmod 644 "${pkgdir}/etc/update-conf.d.conf"
  install -D -m 755 update-conf.d.complex "${pkgdir}/usr/bin/update-conf.d"
  install -D -m 644 update-conf.d.8 "${pkgdir}/usr/share/man/man8/update-conf.d.8"
}
