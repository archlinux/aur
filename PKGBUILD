# Maintainer: Ethan Kiang <chocopuff298@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=autolatex  
pkgver=39.1
pkgrel=3
pkgdesc="Automate generation of large scale LaTeX projects."
url="http://www.arakhne.org/autolatex/"
arch=('any')
license=('GPL')
depends=('glib-perl' 'gtk2-perl' 'python' 'dconf' 'perl-archive-zip' 'perl-locale-gettext' 'perl-config-simple')
backup=("etc/$pkgname/config" )
source=("https://codeload.github.com/gallandarakhneorg/autolatex/zip/autolatiex-$pkgver")
md5sums=('bee0b119abaadf9342604b4d9b137305')
options=('!emptydirs')

prepare() {
  cd $pkgname-$pkgname-$pkgver
  sed -i '14s+^+#+' Makefile.PL
}

build() {
  cd $pkgname-$pkgname-$pkgver
  perl ./Makefile.PL --disable gtk --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgname-$pkgver
  install -d $pkgdir/usr
  perl Makefile.PL --prefix=$pkgdir/usr --disable gtk install
}
