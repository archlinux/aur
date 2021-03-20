pkgname=ip-info-git
pkgver=1.0
pkgrel=1

pkgdesc='Get information about a ip address or domain'
url='https://github.com/siruidops/ip-info_c'
arch=('x86_64')
license=('GPL')
depends=('libcurl-gnutls' 'gcc' 'make')
makedepends=('git')
conflicts=('ip-info-bin')

source=(${pkgname}::git+https://github.com/siruidops/ip-info_c)
sha512sums=('SKIP')

build() {
  cd ${pkgname}
  make
}

package() {
  install -D -t "$pkgdir/usr/bin" "$pkgname/ip-info"
}
