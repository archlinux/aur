# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Steven Allen <steven@stebalien.com>
# Contributor: Jakob Matthes <jakob.matthes@gmail.com>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>

pkgname=roll
pkgver=2.7.0
pkgrel=1
arch=(i686 x86_64)
pkgdesc="A tool to roll a user-defined dice sequence and display the result"
url="https://github.com/matteocorti/roll"
depends=(glibc)
license=(GPL-2.0-or-later)
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/roll-$pkgver.tar.gz")
sha256sums=('9e116501aaa0c8f954d31a86e8cf6dee5d98ee35a5e8e5b025646c4bee741533')

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
