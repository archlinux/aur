# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=poclbm-git
pkgver=20120920.55.g2ae15b7
pkgrel=1
pkgdesc='PyOpenCL bitcoin miner'
url='https://github.com/m0mchil/poclbm'
arch=('any')
license=('custom:public domain')
depends=('python2' 'python2-pyopencl' 'python2-pyserial' 'python2-numpy')
makedepends=('git')
conflicts=('poclbm')
provides=('poclbm')
source=('poclbm.sh'
        'poclbm::git://github.com/m0mchil/poclbm.git')
sha256sums=('da1cb0f2520882fb6a4af2209fabf06008359712e5d04812d2c77c697601c9f0'
            'SKIP')

pkgver() {
  cd poclbm
  git describe --tags | sed 's/-/./g'
}
         
package() {
  install -d "$pkgdir/opt"
  cp -r "$srcdir/poclbm" "$pkgdir/opt/poclbm"
  install -Dm755 poclbm.sh "$pkgdir/usr/bin/poclbm"
  install -Dm644 "$srcdir/poclbm/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
