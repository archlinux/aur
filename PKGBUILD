# Contributor: Matt Smith (Majik) <darkknight@helpdesk.zaz.net>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Maintainer: dorphell <dorphell@archlinux.org>

pkgname=gkrellm
pkgver=2.3.4
pkgrel=1
pkgdesc="System monitor package for GTK2"
arch=('i686' 'x86_64')
url="http://members.dslextreme.com/users/billw/gkrellm/gkrellm.html"
license=('GPL3')
depends=('gtk2' 'openssl' 'libsm' 'lm_sensors')
makedepends=('gettext')
source=(http://members.dslextreme.com/users/billw/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('270917784da6bf1292aba0c82af726d6')

build() {
  cd ${srcdir}/$pkgname-$pkgver

  make LOCALEDIR=/usr/share/locale || return 1
  make DESTDIR=${pkgdir} PREFIX=/usr install
}
