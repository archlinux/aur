# $Id: PKGBUILD 195816 2016-11-14 17:30:46Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor Todd Maynard <arch@toddmaynard.com>

pkgname=pympc
pkgver=20050330
pkgrel=8
pkgdesc="Pympc is a client for the Music Player Daemon [www.musicpd.org] written in Python"
arch=('any')
license=('GPL')
depends=('python2' 'pygtk')
url="http://pympc.sourceforge.net/"
source=("https://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz"
	"$pkgname.desktop")
sha256sums=('9fdaa02025c543990d30a7bf15014780075f9fabf43b42c9fefc1893cb6dc125'
            'b69fe81cfcc83e125065f351642cefe749fca9525bc30a2c82ed1068d344625d')

package() {
  cd "$srcdir"/$pkgname-$pkgver
  python2 setup.py install --root="$pkgdir"
  install -D -m644 "$srcdir"/$pkgname.desktop \
		   "$pkgdir"/usr/share/applications/$pkgname.desktop
}
