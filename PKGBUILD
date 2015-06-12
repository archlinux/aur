# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=gwcd-git
pkgdesc="Whereigo files (.gwc) decompiler (git)"
pkgver=r6.2481325
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/driquet/gwcd"
license=('custom')
depends=('python')
source=("${pkgname}"::'git+https://github.com/driquet/gwcd.git' 'gwcd')
md5sums=('SKIP'
         'e21172d23a5cc196684fda686b8679ee')

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p ${pkgdir}/usr/share/{doc/gwcd,gwcd,licenses/gwcd}
  install -Dm644 $srcdir/${pkgname}/gwcd.py ${pkgdir}/usr/share/gwcd
  install -Dm644 $srcdir/${pkgname}/reader.py ${pkgdir}/usr/share/gwcd
  install -Dm755 $srcdir/gwcd $pkgdir/usr/bin/gwcd
  install -Dm644 $srcdir/${pkgname}/README.rst $pkgdir/usr/share/doc/gwcd
  install -Dm644 $srcdir/${pkgname}/LICENCE $pkgdir/usr/share/licenses/gwcd
}
