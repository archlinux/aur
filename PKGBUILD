# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sven Kauber <celeon@gmail.com>

pkgname=bbrun
pkgver=1.6
pkgrel=5
pkgdesc="A run - component for blackbox window manager"
arch=(x86_64)
#url="http://www.darkops.net/bbrun/"
url="https://packages.debian.org/unstable/x11/bbrun"
license=('GPL')
depends=('gtk2' 'libxpm')
#source=(http://www.darkops.net/bbrun/$pkgname-$pkgver.tar.gz)
source=("http://ftp.de.debian.org/debian/pool/main/b/bbrun/bbrun_$pkgver.orig.tar.gz")
md5sums=('820960e3d52ddf2d5cf7e4ba51821bfd')

build() {
  cd "$srcdir"/$pkgname-$pkgver/$pkgname
  make LIBS="-lXpm `pkg-config --libs gtk+-2.0` -lX11 -lXext"
}

package() {
  cd "$srcdir"/$pkgname-$pkgver/$pkgname
  install -Dm755 bbrun "$pkgdir"/usr/bin/bbrun
}
