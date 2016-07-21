# Contributor: Andrea Scarpino <andrea@archlinux.org|

pkgname=python2-spectacle
pkgver=0.30
pkgrel=1
pkgdesc='Easy spec file management using yaml'
arch=('any')
url='https://wiki.merproject.org/wiki/Spectacle'
license=('GPL2')
depends=('python2-spec' 'python2-yaml' 'python2-cheetah')
makedepends=('python2' 'python2-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/mer-tools/spectacle/archive/${pkgver}.tar.gz")
md5sums=('03421b0055abd166b7da01430f68f073')

build() {
  cd spectacle-${pkgver}
  python2 setup.py build
}

package() {
  cd spectacle-${pkgver}
  python2 setup.py install --root="$pkgdir/" --optimize=1

  install -d "${pkgdir}"/usr/share/spectacle
  install -Dm644 data/{GROUPS,pkgconfig-provides.csv} \
      "${pkgdir}"/usr/share/spectacle
}
