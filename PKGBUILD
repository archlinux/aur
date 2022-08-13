# Maintainer: weilinfox <weilinfox at inuyasha dot love>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: nggtony <nggtony@yahoo.it>
# Moved to AUR4: GI_Jack <iamjacksemail@hackermail.com>

pkgname=darksnow
pkgver=0.7.1
pkgrel=3
pkgdesc="simple GTK2 GUI for darkice"
arch=(i686 x86_64)
url="http://darksnow.radiolivre.org/index.en.html"
license=('GPL')
depends=('darkice' 'gtk2' 'hicolor-icon-theme')
install="$pkgname.install"
source=("http://darksnow.radiolivre.org/pacotes/$pkgname-$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('7c7c55761f7536cea2e8b6d8037c9ce7ca71f6a044c1b6026ea80e13d35b04fd'
            'c35b2679a1d439cc6aff7acadd73a8af3bd0f878bb77e82db32c66f0ef646eb1')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  export CFLAGS="-fcommon $CFLAGS"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make PREFIX="$pkgdir/usr" install

  # desktop file
  install -Dm644 ../$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}

