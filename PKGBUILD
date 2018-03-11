# Maintainer: Proxy <ergo-proxy at domain tlen pl>
# Contributor: Lukasz Kszonowski <archlinux at kszonek dot pl>

pkgname=e-deklaracje
pkgrel=1
pkgver=10.0.1
pkgdesc="Application for submitting tax return in Poland"
arch=('any')
url="http://www.finanse.mf.gov.pl/systemy-informatyczne/e-deklaracje"
license=('custom')
depends=('acroread' 'adobe-air')
source=("e-deklaracje-$pkgver.air::http://www.finanse.mf.gov.pl/documents/766655/1196444/e-DeklaracjeDesktop.air"
         'e-deklaracje.desktop')
sha256sums=('5c603dae387479b07832f45af9802e8ad3f63eefd51603005d9af55eccca6b75'
            'ca9f9337fb40301d34f3e853dd9d7a83374caa0b0bb27fa95310f4dbeeb83743')
noextract=(e-deklaracje-$pkgver.air)

package() {
  unzip -q -u e-deklaracje-$pkgver.air
  install -D -m 644 "$srcdir/e-deklaracje-$pkgver.air" "$pkgdir/opt/$pkgname/e-DeklaracjeDesktop.air"
  install -D -m 644 "$srcdir/assets/icons/icon128.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -D -m 644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

