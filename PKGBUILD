# Maintainer:
# Contributor: Thilo-Alexander Ginkel <tg@tgbyte.de>
# Contributor: Francisco Demartino <demartino.francisco@gmail.com>
# Contributor: Chris Heien <chris.h.heien@gmail.com>

_pkgname="pdfbox"
pkgname="$_pkgname"
pkgver=3.0.2
pkgrel=1
pkgdesc="Java tool for working with PDF documents"
url="https://pdfbox.apache.org"
license=('Apache-2.0')
arch=('any')

depends=('java-runtime')

_jarname="$_pkgname-app-$pkgver.jar"
noextract=("$_jarname")

source=("https://www-eu.apache.org/dist/pdfbox/$pkgver/$_jarname")

sha256sums=('88555c86353f4fb178f83699acd50c79a1f6dcfaa695776cac1320cec3066311')

package() {
  install -Dm644 "$_jarname" "$pkgdir/usr/share/pdfbox/pdfbox.jar"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/pdfbox" << END
#!/bin/sh
exec java -jar /usr/share/pdfbox/pdfbox.jar "\$@"
END
}
