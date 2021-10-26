# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=automedia-git
pkgver=r152.399ae29
pkgrel=1
pkgdesc='Automatically track new releases of media and download them. Supports torrents using rss (nyaa.si) and manga sites using html.'
arch=('x86_64')
url="https://git.dec05eba.com/AutoMedia"
license=('GPL3')
depends=('python' 'python-lxml' 'python-requests' 'python-pure-protobuf' 'curl' 'transmission-cli')
optdepends=('libnotify')
provides=('automedia')
conflicts=('automedia')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/AutoMedia.git.r152.399ae29.tar.gz")
sha512sums=('ff34d03bff624f1bf0b5e01bbeb748b41fef75324c789129c81143e43837e719b680902d6b745a8fdd2754091e6ba808a9a2ab6fbe2e6f523bf860dd559e4435')

package() {
  cd "$srcdir"
  install -Dm755 "automedia" "$pkgdir/usr/bin/automedia"
  install -Dm755 "mangadex-upgrade.py" "$pkgdir/usr/share/automedia/mangadex-upgrade.py"
  for file in plugins/*; do
    install -Dm755 "$file" "$pkgdir/usr/share/automedia/$file"
  done
}
