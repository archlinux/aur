# Maintainer Tomas Ostasevicius <t dot ostasevicius at gmail dot com>
_pkgname=autopep8
pkgname=python2-autopep8-git
pkgver=ver0.5.1.r2002.g92fc70f
pkgrel=1
pkgdesc="Automatically formats Python code to conform to the PEP 8 style guide."
arch=('any')
url="https://github.com/hhatto/autopep8"
license=('MIT')
groups=()
depends=('python2' 'pep8-python2')
makedepends=('python-distribute' 'git')
provides=()
conflicts=()
replaces=(python2-autopep8)
backup=()
options=(!emptydirs)
install=
source=("git+https://github.com/hhatto/autopep8.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_pkgname"
    python setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  mv $pkgdir/usr/bin/autopep8{,-python2}
}

# vim:set ts=2 sw=2 et:
