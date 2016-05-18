# Maintainer: Sebastian Schultz <Sebastian2.Schultz :at: gmail.com> 

pkgname=java-masterpassword
pkgver=0.0
pkgrel=20160518
pkgdesc="A stateless password management solution."
url="http://masterpasswordapp.com/"
license=('GPL')
arch=('any')
depends=('java-runtime')
source=('https://ssl.masterpasswordapp.com/masterpassword-gui.jar'
	'masterpassword.desktop'
	'masterpassword.png')
md5sums=(SKIP
	 '60b233ffe691953248930e866600dd56'
	 'a6f72aca863785f8021305fe417675d2')
noextract=('masterpassword-gui.jar')

 
package() {
  echo '#!/bin/sh' > $srcdir/masterpassword
  echo 'exec /usr/bin/java -jar "/usr/share/java/masterpassword/masterpassword-gui.jar" "$@"' >> $srcdir/masterpassword
  
  install -Dm644 $srcdir/masterpassword-gui.jar ${pkgdir}/usr/share/java/masterpassword/masterpassword-gui.jar
  install -Dm755 $srcdir/masterpassword.desktop ${pkgdir}/usr/share/applications/masterpassword.desktop
  install -Dm755 $srcdir/masterpassword.png ${pkgdir}/usr/share/pixmaps/masterpassword.png
  install -Dm755 $srcdir/masterpassword ${pkgdir}/usr/bin/masterpassword
}
