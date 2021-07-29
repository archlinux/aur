# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: Gwenn Gueguen <gwenn+aur@demisel.net>

pkgname=lcmc
pkgver=1.7.19
pkgrel=1
pkgdesc="Linux Cluster Management Console"
arch=('i686' 'x86_64')
url="http://lcmc.sourceforge.net/"
license=('GPL')
depends=('java-runtime-common' 'libxtst' 'bash' 'hicolor-icon-theme')
source=("LCMC.jar::https://sourceforge.net/projects/lcmc/files/LCMC-${pkgver}.jar/download"
    'http://lcmc.sourceforge.net/changelog'
    'lcmc'
    'lcmc.png'
    'lcmc.desktop'
    'lcmc.install')
noextract=(LCMC.jar)
install=lcmc.install
sha256sums=('cd17d98ca59c6b4ecabf52dd6a4bf6fed3b1549665a832e64ff6a06338b8bb50'
            '5f2e74ac025b39d1645820c9b74b293dc68a84d1304bf6cf6190615ee8885f13'
            'ad18da85a332e8088cc05dae3272cab6d5e2d09ac92e88a73e68df2a3728a4f1'
            '72a225029dfd401306249505fe22377ab5e29e12d7afb1be1f57d3f5168ddb4d'
            '28f8ddfa7b95da8c6112c7b54998f645b93d32ba96f07bb4b61d54c150197548'
            'af318752e90c64f219308d144192ffe3e68b30efe886d4ab87da1ea38c6a0af2')

package() {
  cd "$srcdir"
  install -d $pkgdir/usr/bin
  install -m755 lcmc $pkgdir/usr/bin/
  install -d $pkgdir/usr/lib/${pkgname}
  install -m 644 -t $pkgdir/usr/lib/${pkgname} LCMC.jar changelog
  install -d $pkgdir/usr/share/icons/hicolor/48x48/apps
  install -t $pkgdir/usr/share/icons/hicolor/48x48/apps ${pkgname}.png
  install -d $pkgdir/usr/share/applications
  install -t $pkgdir/usr/share/applications ${pkgname}.desktop
}
