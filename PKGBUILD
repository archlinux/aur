# Contributor: Matt Smith (Majik) <darkknight@helpdesk.zaz.net>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Maintainer: dorphell <dorphell@archlinux.org>

pkgname=gkrellm
pkgver=2.3.5
pkgrel=1
pkgdesc="System monitor package for GTK2"
arch=('i686' 'x86_64')
url="http://members.dslextreme.com/users/billw/gkrellm/gkrellm.html"
license=('GPL3')
depends=('gtk2' 'openssl' 'libsm' 'lm_sensors')
makedepends=('gettext')
backup=('etc/gkrellmd.conf')
source=(http://members.dslextreme.com/users/billw/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('e43a9416a6975e3be63d591bdeb33b04')

build() {
  cd ${srcdir}/$pkgname-$pkgver

  make LOCALEDIR=/usr/share/locale
  make DESTDIR=${pkgdir} PREFIX=/usr install
  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/server/gkrellmd.conf" "${pkgdir}/etc/gkrellmd.conf"
}
