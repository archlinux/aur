# Maintainer: Alexander Nicholi <me@nicholatian.com>
pkgname=slick
pkgver=1.1.0
pkgrel=1
epoch=
pkgdesc='Slick makefiles'
arch=('i686' 'x86_64')
url="https://github.com/aquefir/$pkgname"
license=('BSD')
depends=()
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://github.com/aquefir/$pkgname/archive/mk-v$pkgver.tar.gz" 'aquefir.sh')
sha1sums=('86fe0816fa3e91bc0cbe5c1b19fd9c5acaf20770' 'SKIP')

build() {
  cd "$srcdir/$pkgname-mk-v$pkgver"
}

package() {
  cd "$srcdir/$pkgname-mk-v$pkgver"

  mkdir -p "${pkgdir}/opt/aq/lib/slick"
  mkdir -p "${pkgdir}/etc/profile.d"
  install -m644 -T "src/base.mk" "${pkgdir}/opt/aq/lib/slick/base.mk"
  install -m644 -T "src/targets.mk" "${pkgdir}/opt/aq/lib/slick/targets.mk"
  install -m755 -T "../aquefir.sh" "${pkgdir}/etc/profile.d/aquefir.sh"
}
