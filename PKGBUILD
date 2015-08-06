# Maintainer: Hark <arch@harkonen.net>
pkgname=python2-py-trello-git
pkgver=0.4.3.r0.g476742b
pkgrel=1
pkgdesc="A wrapper around the Trello API written in Python."
arch=('any')
url="https://github.com/sarumont/py-trello"
license=('custom')
depends=('python2')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=(!emptydirs)
source=("${pkgname%-git}::git+http://github.com/sarumont/py-trello.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python2 setup.py install --root="$pkgdir/" --optimize=1

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}

# vim:set ts=2 sw=2 et:
