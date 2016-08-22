# Maintainer: tiagorlampert <tiagorlampert@gmail.com>

pkgname=('jsql-injection')
pkgver=0.77
pkgrel=1
pkgdesc="jSQL Injection is a lightweight application used to find database information from a distant server."
arch=(any)
license=('GPL2')
url="https://github.com/ron190/jsql-injection/"
depends=('jre')
noextract=('jsql-injection-v0.77.jar')
source=("https://github.com/ron190/jsql-injection/releases/download/v$pkgver/jsql-injection-v$pkgver.jar")
sha256sums=('SKIP')

package() {
  cd $srcdir/
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -D -m755 "${srcdir}/jsql-injection-v$pkgver.jar" "${pkgdir}/usr/share/jSQL-Injection/jsql-injection-v$pkgver.jar"
  echo "java -jar /usr/share/jSQL-Injection/jsql-injection-v$pkgver.jar" > "${pkgdir}/usr/bin/jsql-injection"
  chmod 755 "${pkgdir}/usr/bin/jsql-injection"
  unzip "${srcdir}/*.jar" -d jSQL-Injection/
  install -D -m755 "${srcdir}/jSQL-Injection/com/jsql/view/swing/resources/images/software/bug128.png" "${pkgdir}/usr/share/jSQL-Injection/jSQL.png"
  echo "#!/usr/bin/env xdg-open

[Desktop Entry]
Version=0.77
Name=jSQL Injection
Comment=jSQL Injection
Exec=jsql-injection
Icon=/usr/share/jSQL-Injection/jSQL.png
Terminal=false
Type=Application
Categories=Utility;Application;" > "${pkgdir}/usr/share/applications/jSQL Injection.desktop"
  
}
