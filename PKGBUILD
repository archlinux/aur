# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=python2-spectacle
pkgver=0.31
pkgrel=1
pkgdesc='Easy spec file management using yaml'
arch=('any')
url='https://wiki.merproject.org/wiki/Spectacle'
license=('GPL2')
depends=('python2-yaml' 'python2-cheetah')
makedepends=('python2' 'python2-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/mer-tools/spectacle/archive/${pkgver}.tar.gz")
md5sums=('92779ad2097288b5343deeb0d0debcc1')

build() {
  cd spectacle-${pkgver}
  PYTHON=/usr/bin/python2 make
}

package() {
  cd spectacle-${pkgver}
  PYTHON=/usr/bin/python2 make DESTDIR="${pkgdir}" PREFIX=/usr install
}
