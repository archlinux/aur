# Maintainer: milkii on freenode
# Maintainer: tinywrkb
# Contributor: Frederic Bezies <frebezies at gmail dot com>
# Contributor: Benjamin Chretien <chretien at lirmm dot fr>
# Contributor: Adria Arrufat <swiftscythe @t gmail d@t com>
# Contributor: Gordin <9ordin @t gmail d@t com>

pkgname=screenkey-git
pkgver=1.1.r5.g467662b
pkgrel=1
pkgdesc="Screencast tool to show your keys inspired by Screenflick, based on key-mon. Active fork with new features."
arch=('any')
url="https://gitlab.com/screenkey/screenkey"
license=('GPL3')
depends=('gtk3' 'python-gobject' 'python-cairo' 'libxtst')
makedepends=('git' 'python-setuptools' 'python-distutils-extra')
optdepends=('slop: interactive positioning of the output textbox'
  'ttf-font-awesome: multimedia keys symbols')
source=("$pkgname"::"git+https://gitlab.com/wavexx/screenkey.git")
sha1sums=('SKIP')
conflicts=('screenkey')
replaces=('screenkey')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --skip-build --optimize=1 --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
