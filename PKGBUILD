# Maintainer: Manolo Martínez <manolo@austrohungaro.com>

_pkgname=greg
pkgname=greg-git
pkgver=0.4.5
pkgrel=1
pkgdesc="A command-line podcast aggregator."
arch=(any)
url="https://github.com/manolomartinez/greg"
license=('GPL')
depends=('python-feedparser')
optdepends=('python3-stagger-svn: writing metadata'
  'wget: alternative downloadhandler'
	'aria2: alternative downloadhandler'
	'python-beautifulsoup4: convert html to text for tagging')
makedepends=('git')
provides=('greg')
conflicts=('greg')
source=('git://github.com/manolomartinez/greg.git')
md5sums=('SKIP')


pkgver() {
  cd $_pkgname
  git describe --tags --always | sed -e 's|-|.|g'
}

package() {
  cd "$srcdir/$_pkgname"

  msg "Running setup.py..."
  python setup.py install --root="${pkgdir}" --optimize=1
} 
