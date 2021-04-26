# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=automedia-git
pkgver=r125.2ea39b3
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
sha512sums=('56d16232ee051e30a39938feb197a9a7329ce3699b35e219e83359469844da51af8d3c73ae6ca0156bc7714927ec0500afe12f50501228e8ba3d3f839734a8a0')

package() {
  cd "$srcdir"
  install -Dm755 "automedia" "$pkgdir/usr/bin/automedia"
  for file in plugins/*; do
    install -Dm755 "$file" "$pkgdir/usr/share/automedia/$file"
  done
}
