# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=automedia-git
pkgver=r166.4a777d0
pkgrel=1
pkgdesc='Automatically track new releases of media and download them. Supports torrents using rss (nyaa.si) and manga sites using html.'
arch=('x86_64')
url="https://git.dec05eba.com/AutoMedia"
license=('GPL3')
depends=('python' 'python-lxml' 'python-requests' 'python-pure-protobuf' 'curl' 'transmission-cli')
optdepends=('libnotify')
provides=('automedia')
conflicts=('automedia')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/AutoMedia.git.r166.4a777d0.tar.gz")
sha512sums=('6225ed258ace57bca78271a2758f28b74a37cf80282cef19487eda40e622eeb3f4d19f6d7fdbeb838540ab359ec127b48a74232218faa8c90890f89edcea3d52')

package() {
  cd "$srcdir"
  install -Dm755 "automedia" "$pkgdir/usr/bin/automedia"
  for file in plugins/*; do
    install -Dm755 "$file" "$pkgdir/usr/share/automedia/$file"
  done
}
