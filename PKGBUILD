# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=sql-power-architect
pkgver=1.0.8
pkgrel=1
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
            'f3d2d4da9fe61024cfbaf07c4823dfadc340768931cbfc9d5cf593b34c628705'
            'be5b365808e3aa3d50c75f6ebb4397e9b906bbcf9a5c96750f6481b26f065e27')

package() {
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/lib/$pkgname"
  install -d "$pkgdir/usr/share/icons/hicolor/48x48/apps"
  install -d "$pkgdir/usr/share/applications"
  install -m755 $pkgname "$pkgdir/usr/bin/"
  cp -r architect-$pkgver/* "$pkgdir/usr/lib/${pkgname}/"
  install -t "$pkgdir/usr/share/icons/hicolor/48x48/apps" ${pkgname}.png
  install -t "$pkgdir/usr/share/applications" ${pkgname}.desktop
}
