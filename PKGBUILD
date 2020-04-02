# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=sql-power-architect
pkgver=1.0.8
pkgrel=3
pkgdesc="Data Modeling & Profiling Tool"
arch=('any')
url="http://www.bestofbi.com/page/architect"
license=('GPL')
depends=('java-runtime-common' 'libxtst' 'bash' 'hicolor-icon-theme')
source=("https://www.sqlpower.ca/architect/${pkgver}/community/SQL-Power-Architect-generic-jdbc-${pkgver}.tar.gz"
            "$pkgname"
            "$pkgname.desktop"
            "$pkgname.png")
sha256sums=('1e17e1f8b3277509d5e4e6dbc524831c7591c43b64c7f6c3b53044ebe741886b'
            '144ea33434ac1584a6517ea1f651f20b5bfce5b6d4f1d6085bb1447d44437c01'
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
