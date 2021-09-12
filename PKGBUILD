# Contributor: Jesse McClure <code [at] jessemcclure [dot] org>
pkgbase=interrobang
pkgname=$pkgbase-fossil
pkgver=2.0b14
pkgrel=2
pkgdesc="A tiny launcher menu packing a big bang (syntax)"
url="https://code.jessemcclure.org/interrobang"
source=("$pkgbase::fossil+$url")
md5sums=('SKIP')
arch=('x86_64')
license=('custom:MIT')
depends=('libxrender' 'libxft' 'bash' 'python')
makedepends=('fossil')

pkgver() {
  cd "${pkgbase}"
  echo 2.0b$(fossil info | sed -n 's/check-ins: *//p')
}

build() {
  cd "${pkgbase}"
  make
}

package() {
  cd "${pkgbase}"
  make DESTDIR="${pkgdir}" install
}
