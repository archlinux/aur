# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=automedia-git
pkgver=r139.a44c204
pkgrel=1
pkgdesc='Automatically track new releases of media and download them. Supports torrents using rss (nyaa.si) and manga sites using html.'
arch=('x86_64')
url="https://git.dec05eba.com/AutoMedia"
license=('GPL3')
depends=('python' 'python-lxml' 'python-requests' 'python-pure-protobuf' 'curl' 'transmission-cli')
optdepends=('libnotify')
provides=('automedia')
conflicts=('automedia')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/AutoMedia.git.r139.a44c204.tar.gz")
sha512sums=('6aafc872c3b254deb870d9dee0ef34d7525b3b3f7307e06aff096de3f674c02229d2e6dc4fd7d92276c77a80a594cc3a8b21d9fad68eadae57c8bcc5feeb3506')

package() {
  cd "$srcdir"
  install -Dm755 "automedia" "$pkgdir/usr/bin/automedia"
  install -Dm755 "mangadex-upgrade.py" "$pkgdir/usr/share/automedia/mangadex-upgrade.py"
  for file in plugins/*; do
    install -Dm755 "$file" "$pkgdir/usr/share/automedia/$file"
  done
}
