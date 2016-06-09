# Maintainer: JKA Network (JoseluCross, Kprkpr, Yukialba) <contacto@jkanetwork.com>
pkgname=apw
pkgver=1.7.1
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
md5sums=('95d2df47c089f84a9181837aef40398f'
         '5537d13a7c12f771da92d2bcca929b0f'
         'edbb53af2fb22cb5ba90bb57291a6995')

package() {
  echo "pacman" > "$srcdir/apw.conf"
  install -Dm644 $srcdir/apw.conf "${pkgdir}/etc/apw.conf"
  install -Dm644 $srcdir/es.mo "${pkgdir}/usr/share/locale/es/LC_MESSAGES/apw.mo"
  install -Dm755 $srcdir/apw "${pkgdir}/usr/bin/apw"
  install -Dm644 $srcdir/apw.1 "${pkgdir}/usr/share/man/man1/apw.1"
  gzip "${pkgdir}/usr/share/man/man1/apw.1"
}
