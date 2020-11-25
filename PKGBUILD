# Maintainer :  Kr1ss  < $(tr +- .@ <<<kr1ss+x-yandex+com) >
# Contributor : Stephen Argent <steve [at] tuxcon [dot] com>


pkgname=maltego

pkgver=4.2.14.13579
pkgrel=1

pkgdesc='Information gathering software by Paterva'
url="https://www.$pkgname.com"
arch=('i686' 'x86_64')
license=('custom')

depends=('java-runtime')

install="$pkgname.install"
source=("https://$pkgname-downloads.s3.us-east-2.amazonaws.com/linux/Maltego.v$pkgver.deb")
sha256sums=('159bb3a37170966503fe87fc1b28f2f8317c4f22f24fdcdf4ef3c809ab094311')


package() {
  bsdtar -xf data.tar.gz -C "$pkgdir"
  sed -i 's|\(Exec=\)x-www-browser|\1xdg-open|g;s|^\(Version=\).*|\11.0|' \
         "$pkgdir/usr/share/applications/$pkgname"{,_config}.desktop
  chmod g-w "$pkgdir"/usr{,/bin,/share{,/applications,"/$pkgname",/pixmaps}}
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
