# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Elkin Cruz <agnelkincc@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=shedskin-git
pkgver=0.9.8.r98.g3714016d
pkgrel=1
pkgdesc='Experimental (restricted) Python-to-C++ compiler (development version)'
url='https://github.com/shedskin/shedskin'
license=('GPL-3.0-only' 'Expat' 'BSD-3')
source=(git+https://github.com/shedskin/shedskin.git)
sha256sums=('SKIP')
arch=('any')
depends=('pcre' 'gc' 'python')
makedepends=('git' 'python-setuptools')
conflicts=('shedskin')
provides=('shedskin')

pkgver() {
  cd shedskin

  # Get the version number.
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd shedskin

  # Build it!
  python setup.py build
}

package() {
  cd shedskin

  # Install the program.
  python setup.py install --root="$pkgdir" --optimize=1
}
