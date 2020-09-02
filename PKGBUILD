# Maintainer :  Kr1ss $(sed s/\+/./g\;s/\-/@/ <<< \<kr1ss+x-yandex+com\>)
# Contributor : Stephen Argent <steve [at] tuxcon [dot] com>


pkgname=maltego

pkgver=4.2.12.13389
pkgrel=1

pkgdesc='Information gathering software by Paterva'
url="https://www.$pkgname.com"
arch=('i686' 'x86_64')
license=('custom')

depends=('java-runtime')

install="$pkgname.install"
changelog=changelog
source=("https://$pkgname-downloads.s3.us-east-2.amazonaws.com/linux/Maltego.v$pkgver.deb")
sha256sums=('1a0d7ff2ca7d9d370521d047ff9fafbffe12f0d3ce5bd57264d64a2f719855ef')


package() {
  bsdtar xf data.tar.gz -C "$pkgdir"
  # Packagers left DS_Store files, so we have to remove
  rm -rf "$pkgdir"/{,usr/{,share/{,maltego/}}}.DS_Store
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
