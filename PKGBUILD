# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=sql-power-architect
pkgver=1.0.8
pkgrel=2
pkgdesc="Data Modeling & Profiling Tool"
arch=('any')
url="http://www.bestofbi.com/page/architect"
license=('GPL')
depends=('java-runtime-common' 'libxtst' 'bash' 'hicolor-icon-theme')
source=("http://www.bestofbi.com/downloads/architect/${pkgver}/SQL-Power-Architect-generic-jdbc-${pkgver}.tar.gz"
            "$pkgname"
            "$pkgname.desktop"
            "$pkgname.png")
sha256sums=('1e17e1f8b3277509d5e4e6dbc524831c7591c43b64c7f6c3b53044ebe741886b'
            '0e7d2457e19e52a415e0205e2275c66c828fe570c998dfc08b03c791a55ba769'
            'cdb593688a10f1de8d8a4d3447d7df46dcbd8b03f783bf1ae49fc5c160c6a1be'
            '8589e056924b938efc00cf7f5cfb75285888cfb2f9af28e1be2f0c0500f8bf2e')

package() {
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/lib/$pkgname"
  install -d "$pkgdir/usr/share/icons/hicolor/64x64/apps"
  install -d "$pkgdir/usr/share/applications"
  install -m755 $pkgname "$pkgdir/usr/bin/"
  cp -r architect-$pkgver/* "$pkgdir/usr/lib/${pkgname}/"
  install -t "$pkgdir/usr/share/icons/hicolor/64x64/apps" ${pkgname}.png
  install -t "$pkgdir/usr/share/applications" ${pkgname}.desktop
}
