pkgname=apt-file
pkgver=2021.4.0
pkgrel=1
pkgdesc='APT package searching utility'
url='https://packages.debian.org'
arch=('any')
license=('GPL')
depends=('perl-aptpkg')
makedepends=('git')
source=('git+https://salsa.debian.org/apt-team/apt-file.git')
sha256sums=('SKIP')
backup=('etc/apt/apt-file.conf')

build() {
  pwd
  cd apt-file
  make
}

package() {
  cd apt-file
  install -Dm755 apt-file "${pkgdir}/usr/bin/apt-file"
  install -Dm644 apt-file.1 "${pkgdir}/usr/share/man/man1/apt-file.1"
  install -Dm644 examples-apt-conf/apt-file.conf "${pkgdir}/etc/apt/apt-file.conf"
}
