# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=sql-power-architect
pkgver=1.0.9
pkgrel=1
pkgdesc="Data Modeling & Profiling Tool"
arch=('any')
url="http://www.bestofbi.com/page/architect"
license=('GPL')
depends=('java-runtime-common' 'libxtst' 'bash' 'hicolor-icon-theme')
source=("https://8hi8a2.p3cdn1.secureserver.net/wp-content/uploads/2022/10/SQL-Power-Architect-generic-${pkgver}.tar.zip"
            "$pkgname"
            "$pkgname.desktop"
            "$pkgname.png")
sha256sums=('04db3bd65077d580d8ca9a402d58088cb6376dae3d7a255d74cf0a298cd7a377'
            '144ea33434ac1584a6517ea1f651f20b5bfce5b6d4f1d6085bb1447d44437c01'
            'cdb593688a10f1de8d8a4d3447d7df46dcbd8b03f783bf1ae49fc5c160c6a1be'
            '8589e056924b938efc00cf7f5cfb75285888cfb2f9af28e1be2f0c0500f8bf2e')

package() {
  unzip SQL-Power-Architect-generic-${pkgver}.tar.zip
  tar xf SQL-Power-Architect-generic-${pkgver}.tar.gz
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/lib/$pkgname"
  install -d "$pkgdir/usr/share/icons/hicolor/64x64/apps"
  install -d "$pkgdir/usr/share/applications"
  install -m755 $pkgname "$pkgdir/usr/bin/"
  cp -r architect-$pkgver/* "$pkgdir/usr/lib/${pkgname}/"
  install -t "$pkgdir/usr/share/icons/hicolor/64x64/apps" ${pkgname}.png
  install -t "$pkgdir/usr/share/applications" ${pkgname}.desktop
}
