# Maintainer: Benoît Rouits <brouits at free dor fr>
pkgname=qloud
pkgver=1.3a
_pkgver=1.3-alpha
pkgrel=2
pkgdesc="A tool to measure a loudspeaker frequency response and distortions."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/molke-productions/qloud"
license=('GPL')
depends=('fftw' 'jack' 'qwt')
source=("$pkgname.tar.gz::https://github.com/molke-productions/qloud/archive/v$_pkgver.tar.gz")
sha512sums=('4ad124da340cd4f1e3ee43da65ba78c605665be7ce05fd375b09ecd785331adee56d4475b5d191fa7393528768e3c302a8051227d292ada57d2827ab0fffb5a1')

build() {
  cd "$srcdir/$pkgname-$_pkgver"
  qmake
  make
}

package() {
  cd "$srcdir/$pkgname-$_pkgver"
  install -Dm755 bin/qloud $pkgdir/usr/bin/qloud
  install -Dm644 qloud.xpm $pkgdir/usr/share/pixmaps/qloud.xpm
  install -Dm644 qloud.desktop $pkgdir/usr/share/applications/qloud.desktop
}

# vim:set ts=2 sw=2 et:
