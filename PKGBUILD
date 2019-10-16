# Contributor: Kan-Ru Chen <kanru@kanru.info>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-goby
_srcname=goby
pkgver=1.1
pkgrel=3
pkgdesc="WYSIWYG presentation tool, which runs on Emacs"
arch=('any')
url="http://www.mew.org/~kazu/proj/goby/en/index.html"
license=('custom:BSD')
depends=('emacs')
optdepends=('netpbm: for using images' 'imagemagic: for making screen dumps')
source=(http://www.mew.org/~kazu/proj/goby/$_srcname-$pkgver.tar.gz
        LICENSE)
sha256sums=('5050d9be02a8d466e3e46f35fce7e51263aa627519c9a16bea494aea542a47b6'
            '21d7b7a32535aa6cb0b3500f955f1cc3e9327c93c8e15e8310aa61b56f39e24a')
install=$pkgname.install

build() {
  cd ${_srcname}-$pkgver
  make 
}

package() {
  cd ${_srcname}-$pkgver
  install -d "$pkgdir"/usr/share/emacs/site-lisp/goby
  install -Dm644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  make PREFIX="$pkgdir"/usr install
}
