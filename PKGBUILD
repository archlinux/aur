# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Christoph 'delmonico' Neuroth <delmonico@gmx.net>

pkgname=snownews
pkgver=1.6.10
pkgrel=1
pkgdesc="Text mode RSS newsreader for Linux and Unix."
arch=(x86_64)
#url="http://kiza.kcore.de/software/snownews/"
url="https://github.com/kouya/snownews"
license=('GPL')
depends=('libxml2' 'ncurses' 'perl-xml-libxml' 'perl-xml-libxslt')
optdepends=('gettext')
makedepends=('git')
source=("https://github.com/kouya/snownews/archive/${pkgver}.tar.gz")
       #"openssl-pkgconfig.patch")
sha256sums=('8c78067aef75e283df4b3cca1c966587b6654e9e84a3e6e5eb8bdd5829799242')

#prepare() {
#  cd "$srcdir"/$pkgname-$pkgver
#  patch -Np0 -i ../openssl-pkgconfig.patch
#}
  
build() {
  cd "$srcdir"/$pkgname-$pkgver
  #PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig
  #mkdir src 
  ./configure --prefix=./src
  make
}
#
package() {
  cd "$srcdir"/$pkgname-$pkgver
#  install -d "${pkgdir}/usr/share/snownews"
#  cp -a . "${pkgdir}/usr/share/snownews"
#  install -Dm644 man/snownews.1 "${pkgdir}/usr/share/man/man1/snownews.1"
#  install -Dm644 man/opml2snow.1 "${pkgdir}/usr/share/man/man1/opml2snow.1"
#  install -Dm644 man/snownews.de.1 "${pkgdir}/usr/share/man/de/man1/snownews.1"
#  install -Dm644 man/snownews.ru.KOI8-R.1 "${pkgdir}/usr/share/man/ru.KOI8-R/man1/snownews.1"
#  install -Dm755 
#  rm -r ./man 
  make  install
  install -Dm744 src/bin/opml2snow ${pkgdir}/usr/bin/opml2snow
  install -Dm744 src/bin/snow2opml ${pkgdir}/usr/bin/snow2opml
  install -Dm744 src/bin/snownews ${pkgdir}/usr/bin/snownews
  install -Dm644 src/share/man/man1/snownews.1 ${pkgdir}/usr/share/man/man1/snownews.1
  install -Dm644 src/share/man/man1/opml2snow.1 ${pkgdir}/usr/share/man/man1/opml2snow.1
  install -Dm644 src/share/man/de/man1/snownews.1 ${pkgdir}/usr/share/man/de/man1/snownews.1
  install -Dm644 src/share/man/it/man1/snownews.1 ${pkgdir}/usr/share/man/it/man1/snownews.1
  install -Dm644 src/share/man/fr/man1/snownews.1 ${pkgdir}/usr/share/man/fr/man1/snownews.1
  install -Dm644 src/share/man/nl/man1/snownews.1 ${pkgdir}/usr/share/man/nl/man1/snownews.1
  install -Dm644 src/share/man/ru.KOI8-R/man1/snownews.1 ${pkgdir}/usr/share/man/ru.KOI8-R/man1/snownews.1
  install -Dm644 src/share/locale/be@latin/LC_MESSAGES/snownews.mo ${pkgdir}/usr/share/locale/be@latin/LC_MESSAGES/snownews.mo
  install -Dm644 src/share/locale/de/LC_MESSAGES/snownews.mo ${pkgdir}/usr/share/locale/de/LC_MESSAGES/snownews.mo
  install -Dm644 src/share/locale/es/LC_MESSAGES/snownews.mo ${pkgdir}/usr/share/locale/es/LC_MESSAGES/snownews.mo
  install -Dm644 src/share/locale/fr/LC_MESSAGES/snownews.mo ${pkgdir}/usr/share/locale/fr/LC_MESSAGES/snownews.mo
  install -Dm644 src/share/locale/it/LC_MESSAGES/snownews.mo ${pkgdir}/usr/share/locale/it/LC_MESSAGES/snownews.mo
  install -Dm644 src/share/locale/ja/LC_MESSAGES/snownews.mo ${pkgdir}/usr/share/locale/ja/LC_MESSAGES/snownews.mo
  install -Dm644 src/share/locale/ko/LC_MESSAGES/snownews.mo ${pkgdir}/usr/share/locale/ko/LC_MESSAGES/snownews.mo
  install -Dm644 src/share/locale/nl/LC_MESSAGES/snownews.mo ${pkgdir}/usr/share/locale/nl/LC_MESSAGES/snownews.mo
  install -Dm644 src/share/locale/pt_BR/LC_MESSAGES/snownews.mo ${pkgdir}/usr/share/locale/pt_BR/LC_MESSAGES/snownews.mo
  install -Dm644 src/share/locale/ru/LC_MESSAGES/snownews.mo ${pkgdir}/usr/share/locale/ru/LC_MESSAGES/snownews.mo
  install -Dm644 src/share/locale/se/LC_MESSAGES/snownews.mo ${pkgdir}/usr/share/locale/se/LC_MESSAGES/snownews.mo
  install -Dm644 src/share/locale/sl/LC_MESSAGES/snownews.mo ${pkgdir}/usr/share/locale/sl/LC_MESSAGES/snownews.mo
  install -Dm644 src/share/locale/zh_TW/LC_MESSAGES/snownews.mo ${pkgdir}/usr/share/locale/zh_TW/LC_MESSAGES/snownews.mo
  install -Dm644 src/share/locale/zh_CN/LC_MESSAGES/snownews.mo ${pkgdir}/usr/share/locale/zh_CN/LC_MESSAGES/snownews.mo
  install -Dm644 src/share/locale/uk_UA/LC_MESSAGES/snownews.mo ${pkgdir}/usr/share/locale/uk_UA/LC_MESSAGES/snownews.mo
#  ln -fs /usr/bin/opml2snow "$pkgdir"/usr/bin/snow2opml

}
