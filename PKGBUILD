# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('7482 31EB CBD8 08A1 4F5E  85D2 8C00 4C2F 9348 1F6B')
# Past maintainer: onny <onny@project-insanity.org>
# Contributor: onny <onny@project-insanity.org>

pkgname=chapcrack-git
pkgver=ae2827f
pkgrel=5
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

