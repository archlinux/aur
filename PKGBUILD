# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Mark Rosenstand <mark@archlinux.org>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=krb5-auth-dialog
pkgver=43.0
pkgrel=1
pkgdesc="Monitors Kerberos tickets and pops up a dialog when they are about to expire."
arch=('i686' 'x86_64')
url="https://honk.sigxcpu.org/piki/projects/krb5-auth-dialog/"
license=('GPL')
depends=('gcr')
makedepends=('meson' 'itstool' 'pam')
source=("http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz")
sha256sums=('0ebf108f0f4bc1247e8cbbfc7c9f4a50afdf7e79ceb4183ef37aec59d4365397')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  arch-meson . build
  meson compile -C build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  meson install -C build --destdir "$pkgdir"
}
