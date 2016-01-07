# Maintainer: William Grieshaber <me@zee.li>
pkgname=dnscrypt-wrapper
pkgver=0.2
pkgrel=2
pkgdesc="This is dnscrypt wrapper (server-side dnscrypt proxy), which helps to add dnscrypt support to any name resolver."
url="https://dnscrypt.org/"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('libsodium' 'libevent')
makedepends=()
conflicts=()
replaces=()
backup=()
source=("https://github.com/Cofyc/dnscrypt-wrapper/archive/v${pkgver}.tar.gz")
sha512sums=('ca7b84446df8e8b305c9738b122ce44a8a0b627b52b287dff6d50a17558dd38815884bf96912818d79bc79ec7826de76679e21fb5d0120bfbc1e8bffd83f2997')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make configure
  ./configure
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make sbindir=${pkgdir}/usr/bin install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
