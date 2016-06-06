# Maintainer: JKA Network (JoseluCross, Kprkpr, Yukialba) <contacto@jkanetwork.com>
pkgname=apw
pkgver=1.6.1
pkgrel=1
pkgdesc="A Package Wrapper - package wrapper for pacman (and more)"
arch=('any')
url="http://proyecto.jkanetwork.com"
license=('GPL3')
groups=('jka-toolkit')
options=(!emptydirs)
source=("https://gitlab.com/JKANetwork/jka-toolkit/raw/master/jka-toolkit/apw"
	"https://gitlab.com/JKANetwork/jka-toolkit/raw/master/jka-toolkit/i18n/apw/es.mo")
md5sums=('67d7302c1571c15cad46759c93a51bc4'
         '20d61e76ed177fd4e5cc57db30a1ce20')

package() {
  mkdir -p $pkgdir/usr/{bin,share}
  mkdir -p $pkgdir/usr/share/locale/es/LC_MESSAGES/es
  mkdir -p $pkgdir/etc/
  echo "pacman" > "$srcdir/apw.conf"
  install -Dm644 $srcdir/apw.conf "$pkgdir/etc/"
  install -Dm644 $srcdir/es.mo "pkgdir/usr/share/locale/es/LC_MESSAGES/es"
  install -Dm755 $srcdir/apw "$pkgdir/usr/bin/" 
}
