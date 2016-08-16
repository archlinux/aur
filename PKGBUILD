# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=a+
pkgver=4.22
pkgrel=1
pkgdesc='A+ compiler'
arch=('x86_64')
url='http://www.aplusdev.org/'
license=('GPL')
source=("http://http.us.debian.org/debian/pool/main/a/aplus-fsf/aplus-fsf_$pkgver.1-8_amd64.deb")
sha256sums=('279f65f4528ccd5dee41e11f28e6f3b3349e5f333422475fb731f8116f14fe78')

prepare() {
  ar xv aplus-fsf_$pkgver.*.deb && bsdtar jxf data.tar.xz
}

package() {
  install -Dm755 usr/bin/a+ "$pkgdir/usr/bin/a+"
  install -d "$pkgdir/usr/lib"
  for libfile in usr/lib/aplus-fsf/*.*; do
    install -Dm644 "$libfile" "$pkgdir/usr/lib/"
  done
  install -d "$pkgdir/usr/lib/"
  cp -r usr/lib/aplus-fsf "$pkgdir/usr/lib"
  install -Dm644 "usr/share/man/man1/$pkgname.1.gz" \
    "$pkgdir/usr/share/man/man1/$pkgname.1.gz"
}

# vim:set ts=2 sw=2 et:
