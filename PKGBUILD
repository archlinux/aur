# Maintainer: onny <onny@project-insanity.org>
# Contributor: onny <onny@project-insanity.org>

pkgname=chapcrack-git
pkgver=ae2827f
pkgrel=2
pkgdesc="A tool for parsing and decrypting MS-CHAPv2 network handshakes."
arch=('i686' 'x86_64')
url="https://github.com/moxie0/chapcrack"
license="GPL3"
depends=('python2' 'python2-dpkt' 'python2-m2crypto' 'python2-passlib' 'python2-m2crypto')
source=('git+https://github.com/moxie0/chapcrack.git')
md5sums=('SKIP')

pkgver() {
  cd "$SRCDEST/chapcrack"
  git describe --always | sed 's|-|.|g'
}
build() {
  cd "$srcdir/chapcrack"
  python2 setup.py build
} 
package () {
  cd "${srcdir}/chapcrack"
  python2 setup.py install --root=${pkgdir}
}

