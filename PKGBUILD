# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=icmpush
_pkgver=2.2
_debver=7
pkgver=2.2.deb7
pkgrel=1
pkgdesc='ICMP packet builder'
arch=("i686" "x86_64")
url="https://packages.debian.org/src:icmpush"
license=("GPL2")
source=("http://ftp.de.debian.org/debian/pool/main/i/icmpush/icmpush_$_pkgver.orig.tar.gz"
        "http://ftp.de.debian.org/debian/pool/main/i/icmpush/icmpush_$_pkgver-$_debver.debian.tar.xz")
sha256sums=('2663e00d9373856b2c4be43c6a4f2da7c4dba4449d310a0d33a69de6f643174a'
            '0c2fd2d1e6059fd2342763eaa29468c963182c68f6e8c1a86a84433234197a07')

prepare() {
  cd "$pkgname-$_pkgver.orig"
  patch -Np1 < "../debian/patches/debian.patch"
}

build() {
  cd "$pkgname-$_pkgver.orig"
  make linuz
}

package() {
  cd "$pkgname-$_pkgver.orig"
  install -Dm 755 icmpush "$pkgdir/usr/bin/icmpush"
  install -Dm 644 icmpush.8 "$pkgdir/usr/share/man/man8/icmpush.8"
}

# vim: ft=sh:ts=2:sw=2:et
