# Maintainer: callmetango
# Contributor: artist <artist@artixlinux.org>

pkgname=sonic-silver-sddm
pkgver=1.1.0
pkgrel=1
pkgdesc="Sonic Silver SDDM Theme (KDE Plasma 6)"
arch=(x86_64)
url='https://github.com/Sonic-DE/silver-sddm'
license=('LGPL-2.0-or-later')
depends=(sonic-workspace)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('7af2afea4e7724bafe7e7cb37ad07bc0f523bad1cef774680ef9163adb97a0d0')

package() {
  cd "${pkgname}-${pkgver}"
  install -d "$pkgdir/usr/share/sddm/themes"
  cp -rv Sonic-Silver "${pkgdir}/usr/share/sddm/themes"
  cp -rv Sonic-Silver-Light "${pkgdir}/usr/share/sddm/themes"

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" CHANGELOG README.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
