# Maintainer: mrxx <mrxx at cyberhome dot at>
# previous maintainer: Gwenn Gueguen <gwenn+aur@demisel.net>

pkgname=lcmc
pkgver=1.7.8
pkgrel=1
pkgdesc="Linux Cluster Management Console"
arch=('i686' 'x86_64')
url="http://lcmc.sourceforge.net/"
license=('GPL')
depends=('java-runtime-common' 'libxtst' 'bash' 'hicolor-icon-theme')
source=("http://downloads.sourceforge.net/project/$pkgname/LCMC-$pkgver.jar"
    'lcmc'
    'lcmc.png'
    'lcmc.desktop'
    'lcmc.install'
    'Changelog')
noextract=(LCMC-$pkgver.jar)
install=lcmc.install

sha1sums=('17b9b404bfa5460e1b6c80b054f8d5efe9208b81'
          'acff8d95b9c1b55940e359c3c4c796ac6f3fc0a9'
          '84f8ab9b450c9e51d828435f12e72cfc851af0cf'
          '583f30b90058efb742a9ecc8e7f33e5e98048341'
          'e8b239a493dd5e1eb7e3dc5989bb03800e76a38d'
          'SKIP')

package() {
  cd "$srcdir"
  install -d $pkgdir/usr/bin
  install -m 0755 -t $pkgdir/usr/bin lcmc
  install -d $pkgdir/usr/lib/${pkgname}
  install -t $pkgdir/usr/lib/${pkgname} LCMC-$pkgver.jar Changelog
  mv $pkgdir/usr/lib/${pkgname}/LCMC-$pkgver.jar $pkgdir/usr/lib/${pkgname}/${pkgname^^*}.jar
  install -d $pkgdir/usr/share/icons/hicolor/48x48/apps
  install -t $pkgdir/usr/share/icons/hicolor/48x48/apps ${pkgname}.png
  install -d $pkgdir/usr/share/applications
  install -t $pkgdir/usr/share/applications ${pkgname}.desktop
}
