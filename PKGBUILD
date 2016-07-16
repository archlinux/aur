# Maintainer: JKA Network (JoseluCross, Kprkpr, Yukialba) <contacto@jkanetwork.com>
pkgname=apw
pkgver=1.9.1
pkgrel=1
pkgdesc="A Package Wrapper - package wrapper for pacman (and more)"
arch=('any')
url="http://proyecto.jkanetwork.com"
license=('GPL3')
groups=('jka-toolkit')
options=(!emptydirs)
source=("https://gitlab.com/JKANetwork/jka-toolkit/raw/master/jka-toolkit/apw"
	"https://gitlab.com/JKANetwork/jka-toolkit/raw/master/jka-toolkit/i18n/apw/es.mo"
	"https://gitlab.com/JKANetwork/jka-toolkit/raw/master/manpages/apw.1")
md5sums=('747e3f6b4e8b685ce55dc1b93c678838'
         'f624a305facbe30b96720f13784ddc26'
         'edbb53af2fb22cb5ba90bb57291a6995')

package() {
  echo "pacman" > "$srcdir/apw.conf"
  install -Dm644 $srcdir/apw.conf "${pkgdir}/etc/apw.conf"
  install -Dm644 $srcdir/es.mo "${pkgdir}/usr/share/locale/es/LC_MESSAGES/apw.mo"
  install -Dm755 $srcdir/apw "${pkgdir}/usr/bin/apw"
  install -Dm644 $srcdir/apw.1 "${pkgdir}/usr/share/man/man1/apw.1"
  gzip "${pkgdir}/usr/share/man/man1/apw.1"
}
