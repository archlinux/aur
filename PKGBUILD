# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=otf-eau-douce-sans
_pkgname=eau_douce_sans
pkgver=2.4.0
pkgrel=1
pkgdesc='San-serif font by Yamaoka Yasuhiro'
arch=('any')
url='https://yoworks.blogspot.com.au/2011/02/eau-douce-sans-2008-2011.html'
license=('custom')
install=$pkgname.install
source=("https://web.archive.org/web/20180121094813/http://yoworks.com:80/eau_douce/$_pkgname.zip")
sha256sums=('dccbe80b6db9de4c941e3c257eecf56950373031d52da9b8b6a4771725963a77')

prepare() {
  cd "$srcdir"
  # Remove non-essential files
  find . -name '.DS_Store' -delete
  rm 'eau_douce_sans/read me html/img/'{Norton\ FS\ Index,OpenFolderListDF$'\r'}
}

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 'eau_douce_sans/outline font/'*.otf "$pkgdir/usr/share/fonts/OTF"

  install -d "$pkgdir/usr/share/licenses"
  cp -r 'eau_douce_sans/read me html' "$pkgdir/usr/share/licenses/$pkgname"
}
