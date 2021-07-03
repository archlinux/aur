# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=automedia-git
pkgver=r136.ba7bce3
pkgrel=1
pkgdesc='Automatically track new releases of media and download them. Supports torrents using rss (nyaa.si) and manga sites using html.'
arch=('x86_64')
url="https://git.dec05eba.com/AutoMedia"
license=('GPL3')
depends=('python' 'python-lxml' 'python-requests' 'python-pure-protobuf' 'curl' 'transmission-cli')
optdepends=('libnotify')
provides=('automedia')
conflicts=('automedia')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/AutoMedia.git.r136.ba7bce3.tar.gz")
sha512sums=('00c5a8cfcf5ad4c9b00ae8d5368561e4d9664264d756c5076e7cdc03fa2e7f65021f3457ed83a93b32bb153a8d576ce5c44db86917f65f010800b0a084422c4e')

package() {
  cd "$srcdir"
  install -Dm755 "automedia" "$pkgdir/usr/bin/automedia"
  install -Dm755 "mangadex-upgrade.py" "$pkgdir/usr/share/automedia/mangadex-upgrade.py"
  for file in plugins/*; do
    install -Dm755 "$file" "$pkgdir/usr/share/automedia/$file"
  done
}
