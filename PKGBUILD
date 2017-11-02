# Maintainer: Proxy <ergo-proxy at domain tlen pl>
# Contributor: Lukasz Kszonowski <archlinux at kszonek dot pl>

pkgname=e-deklaracje
pkgrel=1
pkgver=9.0.6
pkgdesc="Application for submitting tax return in Poland"
arch=('any')
url="http://www.finanse.mf.gov.pl/systemy-informatyczne/e-deklaracje"
license=('custom')
depends=('acroread' 'adobe-air')
source=('http://www.finanse.mf.gov.pl/documents/766655/1196444/e-DeklaracjeDesktop.air'
        'e-deklaracje.desktop')
sha256sums=('47ca3a5f63845cf595a155993c56f231f30881d0745e2d6d84e36f116f939aff'
            'ca9f9337fb40301d34f3e853dd9d7a83374caa0b0bb27fa95310f4dbeeb83743')
noextract=(e-DeklaracjeDesktop.air)

package() {
  unzip -q -u e-DeklaracjeDesktop.air
  install -D -m 644 "$srcdir/e-DeklaracjeDesktop.air" "$pkgdir/opt/$pkgname/e-DeklaracjeDesktop.air"
  install -D -m 644 "$srcdir/assets/icons/icon128.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -D -m 644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

