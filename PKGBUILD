# Maintainer: kitsunyan <kitsunyan@inbox.ru>

pkgname=systemd-boot-password
pkgver=0.9.5.236
pkgrel=1
pkgdesc='systemd-boot with password-protected editor'
arch=('i686' 'x86_64')
url="https://github.com/kitsunyan/$pkgname"
license=('LGPL2.1')
makedepends=('gnu-efi-libs' 'docbook-xsl')
optdepends=('sbsigntools: signing support')
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('eaa7817f12f3090b3174a25515966de52d70dd357bbbaaee05a666358617f81e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
