# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Ghost of Kendo <ghostofkendo at gmail dot com>

pkgname=ispin
pkgver=1.1.4
pkgrel=2
pkgdesc="New Tcl/Tk GUI for Spin replacing xSpin"
arch=('any')
url="http://spinroot.com/"
license=('custom:SPIN')
depends=('spin>=6.0' 'tk>=8.5' 'gcc')
optdepends=('graphviz: recommended, provides dot tool for automata view'
            'curl: for version check information')
source=("http://spinroot.com/spin/Src/$pkgname.tcl"
	'LICENSE.txt')
DLAGENTS='http::/usr/bin/curl -A "Mozilla/4.0" -fLC - --retry 3 --retry-delay 3 -o %o %u'
md5sums=('8d61b59a650f79cf5e19f1edc27ebdcf'
         '1b7db1b5f5da972bab3db17472e3a342')

package() {
  cd "$srcdir/"

  install -Dm755 $pkgname.tcl $pkgdir/usr/bin/$pkgname
  
  install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}

