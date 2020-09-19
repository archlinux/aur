# Maintainer :  Kr1ss  < $(tr +- .@ <<<kr1ss+x-yandex+com) >
# Contributor : Stephen Argent <steve [at] tuxcon [dot] com>


pkgname=maltego

pkgver=4.2.13.13462
pkgrel=1

pkgdesc='Information gathering software by Paterva'
url="https://www.$pkgname.com"
arch=('i686' 'x86_64')
license=('custom')

depends=('java-runtime')

install="$pkgname.install"
source=("https://$pkgname-downloads.s3.us-east-2.amazonaws.com/linux/Maltego.v$pkgver.deb")
sha256sums=('2e3baabb838ac3307366425df62238a627969e2a1bbd7d7968581f67e973604d')


package() {
  bsdtar -xf data.tar.gz -C "$pkgdir"
  sed -i 's|\(Exec=\)x-www-browser|\1xdg-open|g' "$pkgdir/usr/share/applications/$pkgname.desktop"
  chmod g-w "$pkgdir"/usr{,/bin,/share{,/applications,"/$pkgname",/pixmaps}}
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
