# Maintainer: Sich <little_sich@tuta.io>
# Contributor: Ivan Zenin <i.zenin@gmx.com> 
pkgname=lz4json-git
pkgver=r5.gc44c510
pkgrel=1
pkgdesc="C decompress tool for mozilla lz4json format (development version)"
arch=('i686' 'x86_64')
url="https://github.com/andikleen/lz4json"
depends=('lz4')
provides=('lz4json')
makedepends=('git')
source=(git+https://github.com/andikleen/lz4json.git)
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}"/lz4json
  git describe --long --tags --abbrev=7 | sed 's/^v2-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}"/lz4json
  make lz4jsoncat
}

package() {
  cd "${srcdir}"/lz4json
  install -Dm755 lz4jsoncat "${pkgdir}/usr/bin/lz4jsoncat"
}
