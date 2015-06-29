# Maintainer: Peter Hoeg <firstname at lastname dot com>

pkgname=cfget
pkgver=0.19
pkgrel=1
pkgdesc='Read values from configuration files'
arch=('any')
url='http://www.enricozini.org/sw/cfget/'
license=('GPL')
provides=('cfget')
depends=('python')
source=("git+https://anonscm.debian.org/git/users/enrico/cfget.git#tag=debian/${pkgver}-${pkgrel}")
sha1sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  test -f cfget.1 || ./update-manpage
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 cfget "$pkgdir/usr/bin/cfget"
  install -Dm644 cfget.1 "$pkgdir/usr/share/man/man1/cfget.1"
}

# vim:set ts=2 sw=2 et:
