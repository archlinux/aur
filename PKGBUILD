# Maintainer: JKA Network (JoseluCross, Kprkpr, Yukialba) <contacto@jkanetwork.com>
pkgname=apw
pkgver=1.8
pkgrel=2
pkgdesc="A Package Wrapper - package wrapper for pacman (and more)"
arch=('any')
url="http://proyecto.jkanetwork.com"
license=('GPL3')
groups=('jka-toolkit')
options=(!emptydirs)
source=("https://gitlab.com/JKANetwork/jka-toolkit/raw/master/jka-toolkit/apw"
	"https://gitlab.com/JKANetwork/jka-toolkit/raw/master/jka-toolkit/i18n/apw/es.mo"
	"https://gitlab.com/JKANetwork/jka-toolkit/raw/master/manpages/apw.1")
md5sums=('f99c0bc2ca6a764e66b556e23dcd9d95'
         '8cad0d2577eeff99548833e52e00435e'
         'edbb53af2fb22cb5ba90bb57291a6995')

package() {
  echo "pacman" > "$srcdir/apw.conf"
  install -Dm644 $srcdir/apw.conf "${pkgdir}/etc/apw.conf"
  install -Dm644 $srcdir/es.mo "${pkgdir}/usr/share/locale/es/LC_MESSAGES/apw.mo"
  install -Dm755 $srcdir/apw "${pkgdir}/usr/bin/apw"
  install -Dm644 $srcdir/apw.1 "${pkgdir}/usr/share/man/man1/apw.1"
  gzip "${pkgdir}/usr/share/man/man1/apw.1"
}
