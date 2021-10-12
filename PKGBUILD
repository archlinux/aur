# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=automedia-git
pkgver=r151.aa816c3
pkgrel=1
pkgdesc='Automatically track new releases of media and download them. Supports torrents using rss (nyaa.si) and manga sites using html.'
arch=('x86_64')
url="https://git.dec05eba.com/AutoMedia"
license=('GPL3')
depends=('python' 'python-lxml' 'python-requests' 'python-pure-protobuf' 'curl' 'transmission-cli')
optdepends=('libnotify')
provides=('automedia')
conflicts=('automedia')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/AutoMedia.git.r151.aa816c3.tar.gz")
sha512sums=('413a67d06e56fcb2bc7fff858c7bc2b010f2f1023fa783522788a9aa605ffc130729bae95d64f184eec996e4659a54bcbba5d0957b0f36a910f3bbc126bae254')

package() {
  cd "$srcdir"
  install -Dm755 "automedia" "$pkgdir/usr/bin/automedia"
  install -Dm755 "mangadex-upgrade.py" "$pkgdir/usr/share/automedia/mangadex-upgrade.py"
  for file in plugins/*; do
    install -Dm755 "$file" "$pkgdir/usr/share/automedia/$file"
  done
}
