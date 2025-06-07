# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=html2text-cpp
pkgver=2.3.0
pkgrel=1
pkgdesc='HTML to text rendering aimed for E-mail'
arch=(x86_64)
#url=https://github.com/grobian/html2text
url=https://gitlab.com/grobian/html2text
license=(GPL-2.0-or-later)
#depends=(gcc-libs)
#source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/html2text-v$pkgver.tar.gz")
sha256sums=('342ed425161708822f08e61148d4bfa66aab5b4279e8339ae59d264b0b169763')

build() {
  #cd "${pkgname%-cpp}-$pkgver"
  cd "${pkgname%-cpp}-v$pkgver"
  #autoreconf -fi
  ./configure
  make
}

package() {
  #cd "${pkgname%-cpp}-$pkgver"
  cd "${pkgname%-cpp}-v$pkgver"
  #make DESTDIR="$pkgdir" install
  install -Dm755 html2text "$pkgdir/usr/bin/$pkgname"
  install -Dm644 html2text.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dm644 html2textrc.5 "$pkgdir/usr/share/man/man5/${pkgname}rc.5"
}
