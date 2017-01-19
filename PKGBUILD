# Maintainer: Proxy <ergo-proxy at domain tlen pl>
# Contributor: Lukasz Kszonowski <archlinux at kszonek dot pl>

pkgname=e-deklaracje
pkgrel=1
pkgver=9.0.1
pkgdesc="Application for submitting tax return in Poland"
arch=('any')
url="http://www.finanse.mf.gov.pl/systemy-informatyczne/e-deklaracje"
license=(unknown)
depends=('acroread' 'adobe-air')

source=('e-DeklaracjeDesktop.air::http://www.finanse.mf.gov.pl/documents/766655/1196444/e-DeklaracjeDesktop.air' 'e-deklaracje.desktop')
noextract=(e-DeklaracjeDesktop.air)

package() {
  unzip -q -u e-DeklaracjeDesktop.air
  install -D -m 644 "$srcdir/e-DeklaracjeDesktop.air" "$pkgdir/opt/$pkgname/e-DeklaracjeDesktop.air"
  install -D -m 644 "$srcdir/assets/icons/icon128.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -D -m 644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
md5sums=('ccff713adc61f213993005b038ed4d5e'
         'f9532049b12814ffe6b84fa57bac52e4')
