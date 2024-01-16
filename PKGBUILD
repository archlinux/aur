# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=pkg2zip-git
pkgver=2.3.13.g97a3985
pkgrel=1
arch=('x86_64')
pkgdesc='Decrypts PlayStation Vita pkg file and packages to zip archive. (GIT version)'
url='https://github.com/lusid1/pkg2zip'
license=('custom:unlicense')
depends=('glibc')
source=('git+https://github.com/lusid1/pkg2zip.git')
sha256sums=('SKIP')

pkgver() {
  cd pkg2zip
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

build() {
  cd pkg2zip
  make CFLAGS="${CFLAGS} -Wno-format-truncation"
}

package() {
  cd pkg2zip
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 pkg2zip "${pkgdir}"/usr/bin/pkg2zip
}
