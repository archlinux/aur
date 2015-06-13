# Mantainer: <mclenin.at.gmail.com>

pkgname=airstream
pkgver=5.4.3
pkgrel=1
pkgdesc="Computer side of the AirStream software for Android streaming"
arch=('any')
url="http://airstream.io/"
license=('Commercial')
depends=('java-runtime' 'ffmpeg')
source=(http://54.212.250.206/pc-suites/airstream-linux.zip
        airstream.sh
        airstream.desktop
        logo.xpm)
md5sums=('772381994cc3d9d9f00777c50adea5a9'
         'a891e24b4665f9e56cb7e5e73a78b167'
         '16019fb4fb54223c1c284ab77633f811'
         'd6d603539039d76e178ffed6eab14fe1')

package() {
  cd ${srcdir}/AirStreamLinux
  install -Dm755 airstream-linux.jar ${pkgdir}/usr/share/java/${pkgname}/airstream-linux.jar
  install -Dm755 Indexer.jar ${pkgdir}/usr/share/java/${pkgname}/Indexer.jar
  install -Dm755 AirstreamVideoIndexer.jar ${pkgdir}/usr/share/java/${pkgname}/AirstreamVideoIndexer.jar

  cd ${srcdir}
  install -Dm755 ${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 logo.xpm ${pkgdir}/usr/share/pixmaps/airstream.xpm
  install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  
}
