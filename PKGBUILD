# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=automedia-git
pkgver=r115.3d5be6f
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
sha512sums=('e2bbf0d7b6253c05cd25b63ff595c51c539d3a282a22c8be77705f1b20a3d3278c4193758b1093eda29ad849e4da0caea20cc2a9846a8bb3cfdf572573301a67')

package() {
  cd "$srcdir"
  install -Dm755 "automedia" "$pkgdir/usr/bin/automedia"
  for file in plugins/*; do
    install -Dm755 "$file" "$pkgdir/usr/share/automedia/$file"
  done
}
