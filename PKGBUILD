# Maintainer: Your Name <your@email.com>
pkgname=paq8px-dill
pkgver=1.0
pkgrel=1
pkgdesc="paq8px compressor program without filesize limitation"
arch=('x86_64')
url="https://github.com/dillfrescott/paq8px"
license=('GPL')
depends=('gcc' 'cmake' 'make' 'git')
source=("git+${url}.git")
md5sums=('SKIP')

build() {
  cd "${srcdir}/paq8px"
  cmake .
  make
}

package() {
  cd "${srcdir}/paq8px"
  install -D -m755 paq8px "${pkgdir}/usr/bin/paq8px"
}
