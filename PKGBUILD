# Maintainer: Benoît Rouits <brouits at free dor fr>
pkgname=qloud-qtcharts
_pkgname=qloud
pkgver=1.4a
_pkgver=1.4a
pkgrel=1
pkgdesc="Tool to measure loudspeaker frequency response and distortions. QtCharts flavour."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/be1/qloud"
license=('GPL')
depends=('fftw' 'jack' 'qt5-charts')
conflicts=('qloud')
source=("$_pkgname-$_pkgver.tar.gz::https://github.com/be1/$_pkgname/archive/$_pkgver.tar.gz")
sha512sums=('7adbfbf83e2db8f4ed11fcee0bd5a2bdc85fa6b2f69eeccd5bc7a95f9361793b8dae060f02198e5709cf739d57a1a55ba10967b2806412bc3e42780d1dc506a9')

build() {
  cd "$srcdir/$_pkgname-$_pkgver"
  qmake -config release
  make
}

package() {
  cd "$srcdir/$_pkgname-$_pkgver"
  install -Dm755 bin/qloud $pkgdir/usr/bin/qloud
  install -Dm644 qloud.xpm $pkgdir/usr/share/pixmaps/qloud.xpm
  install -Dm644 qloud.desktop $pkgdir/usr/share/applications/qloud.desktop
}

# vim:set ts=2 sw=2 et:
