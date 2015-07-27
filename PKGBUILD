# Maintainer: Andreas Wagner <andreas.wagner@lowfatcomputing.org>
# Contributor: Willy Goiffon <w.goiffon@gmail.com>
_pkgname=ptii
pkgname=${_pkgname}-git
pkgver=v0.4.r1.gc00e275
pkgrel=1
pkgdesc="CLI-like environment to interact with ii (irc it) -- git version"
url="http://blog.z3bra.org/2014/03/toolbox.html#ptii"
arch=('x86_64' 'i686')
license=('WTFPL')
depends=('ii')
optdepends=('multitail')
makedepends=('git')
conflicts=('ptii-dumb')
replaces=('ptii-dumb')
backup=()
install=
source=("$pkgname::git://z3bra.org/ptii")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
  echo "hey pssst... take a look at the README ;)"
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/${_pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
