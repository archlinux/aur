# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Past maintainer: onny <onny@project-insanity.org>
# Contributor: onny <onny@project-insanity.org>

pkgname=chapcrack-git
pkgver=ae2827f
pkgrel=6
pkgdesc="A tool for parsing and decrypting MS-CHAPv2 network handshakes."
arch=('i686' 'x86_64')
url="https://github.com/moxie0/chapcrack"
license=("GPL3")
depends=('python2' 'python2-dpkt' 'python2-m2crypto' 'python2-passlib')
source=('git+https://github.com/moxie0/chapcrack.git')
sha512sums=('SKIP')

pkgver() {
  cd "${SRCDEST}/chapcrack"
  git describe --always | sed 's|-|.|g'
}
build() {
  cd "${srcdir}/chapcrack"
  python2 setup.py build
} 
package () {
  cd "${srcdir}/chapcrack"
  python2 setup.py install --root=${pkgdir}
}

