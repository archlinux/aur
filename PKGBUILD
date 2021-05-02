# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=automedia-git
pkgver=r127.52c6355
pkgrel=1
pkgdesc='Automatically track new releases of media and download them. Supports torrents using rss (nyaa.si) and manga sites using html.'
arch=('x86_64')
url="https://git.dec05eba.com/AutoMedia"
license=('GPL3')
depends=('python' 'python-lxml' 'python-requests' 'python-pure-protobuf' 'curl' 'transmission-cli')
optdepends=('libnotify')
provides=('automedia')
conflicts=('automedia')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/AutoMedia.git.tar.gz")
sha512sums=('9f306a4a0b6be6d0e2785c04b293be1925d9dd4c73b9095bcfc9f6e923ce5a16e4fa91cadd8594f7a9782ce9d417ba62a4ccef980747823f8371a229c3a1a09c')

package() {
  cd "$srcdir"
  install -Dm755 "automedia" "$pkgdir/usr/bin/automedia"
  for file in plugins/*; do
    install -Dm755 "$file" "$pkgdir/usr/share/automedia/$file"
  done
}
