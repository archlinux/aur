# Maintainer: Marek Küthe <m.k@mk16.de>
# Contributor: Po-An,Yang(Antonio) <yanganto@gmail.com>

pkgname=pcapfix
pkgver=1.1.7
pkgrel=1
pkgdesc="tries to repair your broken pcap and pcapng files"
arch=('x86_64')
url="https://f00l.de/pcapfix/"
license=('GPL-3.0-or-later')
source=("$url$pkgname-$pkgver.tar.gz" "$url$pkgname-$pkgver.tar.gz.asc")
sha512sums=(d8d1106349116303f35254f680916f1ea26b163f9afceb5d237eed89880810d4b7b40ebca9de58ec95af2336dd78f4e11af1a08b89f6765055843a9791c156bd 15d6758ab4c5b2cedcca1471ab2e9460de6ca7f71b33389ada3874dc3e6f66441bbab2d9a09fbc0114a93696a2f30bb4979a3fe1bc0bb38fe48988c7c029f544)
validpgpkeys=(0CA58C10434DAB2EA5CBE63261C513806A6AE3EA)

build() {
  cd "$pkgname-$pkgver"

  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -pDm644 Changelog "$pkgdir/usr/share/doc/$pkgname/Changelog"
}
