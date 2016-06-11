# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=icmpush
pkgver=2.2
pkgrel=2
pkgdesc='ICMP packet builder'
arch=("i686" "x86_64")
url="https://packages.debian.org/src:icmpush"
license=("GPL2")
source=("http://ftp.de.debian.org/debian/pool/main/i/icmpush/icmpush_$pkgver.orig.tar.gz"
        "http://ftp.de.debian.org/debian/pool/main/i/icmpush/icmpush_2.2-6.diff.gz")
sha256sums=('2663e00d9373856b2c4be43c6a4f2da7c4dba4449d310a0d33a69de6f643174a'
            'f461e10bb234b169f262743394130ac0b6f879bb21787a791d489e58dd7a388b')

prepare() {
  cd "$pkgname-$pkgver.orig"
  patch -p1 < "../icmpush_2.2-6.diff"
}

build() {
  cd "$pkgname-$pkgver.orig"
  make linuz
}

package() {
  cd "$pkgname-$pkgver.orig"
  install -Dm 755 icmpush "$pkgdir/usr/bin/icmpush"
  install -Dm 644 icmpush.8 "$pkgdir/usr/share/man/man8/icmpush.8"
}

# vim: ft=sh:ts=2:sw=2:et
