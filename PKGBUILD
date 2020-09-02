# Maintainer :  Kr1ss  < $(tr +- .@ <<<kr1ss+x-yandex+com) >
# Contributor : Stephen Argent <steve [at] tuxcon [dot] com>


pkgname=maltego

pkgver=4.2.12.13389
pkgrel=2

pkgdesc='Information gathering software by Paterva'
url="https://www.$pkgname.com"
arch=('i686' 'x86_64')
license=('custom')

depends=('java-runtime')

install="$pkgname.install"
source=("https://$pkgname-downloads.s3.us-east-2.amazonaws.com/linux/Maltego.v$pkgver.deb")
sha256sums=('1a0d7ff2ca7d9d370521d047ff9fafbffe12f0d3ce5bd57264d64a2f719855ef')


package() {
  bsdtar -xf data.tar.gz -C "$pkgdir"
  sed -i 's|\(Exec=\)x-www-browser|\1xdg-open|g' "$pkgdir/usr/share/applications/$pkgname.desktop"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
