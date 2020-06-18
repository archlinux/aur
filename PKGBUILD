# Maintainer: Frederic Bezies <frebezies at gmail dot com>
# Contributor: Benjamin Chretien <chretien at lirmm dot fr>
# Contributor: Adria Arrufat <swiftscythe @t gmail d@t com>
# Contributor: Gordin <9ordin @t gmail d@t com>

pkgname=screenkey-git
pkgver=0.9.r42.g0c3454b
pkgrel=1
pkgdesc="Screencast tool to show your keys inspired by Screenflick, based on key-mon. Active fork with new features."
arch=('any')
url="https://gitlab.com/wavexx/screenkey"
license=('GPL3')
depends=('python2' 'pygtk' 'libx11')
makedepends=('git' 'python2-distutils-extra' 'python2-setuptools')
optdepends=('slop' 'ttf-font-awesome')
source=("$pkgname"::"git+https://gitlab.com/wavexx/screenkey.git")
sha1sums=('SKIP')
conflicts=('screenkey')
replaces=('screenkey')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed 's/^screenkey-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"

  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname"

  python2 setup.py install --skip-build --optimize=1 --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
