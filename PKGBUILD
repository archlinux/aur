# Contributor: Roberto Alsina <ralsina@kde.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=eel-language
pkgver=0.3.6
pkgrel=5
pkgdesc="A scripting and programming language"
arch=('i686' 'x86_64')
url="http://eelang.org"
license=('LGPL')
depends=('bash')
source=("http://eelang.org/download/EEL-$pkgver.tar.bz2")
sha256sums=('2fe71de4643dbe2be6edba09a5de96c8664c398b3cb496a5bf18c1a0a5c679bf')
options=('!libtool' 'staticlibs')

build() {
  cd EEL-$pkgver
  ./configure --prefix=/usr
  make
}
package() {
  cd EEL-$pkgver
  make DESTDIR="$pkgdir" install
}
