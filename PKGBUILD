# Maintainer: Javier Tia <javier.tia at gmail dot com>
pkgname='python2-fusepy'
pkgver=2.0.2
pkgrel=2
pkgdesc='Simple ctypes bindings for FUSE'
url='https://github.com/terencehonles/fusepy'
arch=('any')
license=('custom:ISCL')
depends=('fuse>=2.6' 'python2')
makedepends=('python2-setuptools')
conflicts=('python2-fuse' 'python2-fusepy-git')
source=("https://github.com/terencehonles/fusepy/archive/v${pkgver}.tar.gz")
sha256sums=('31fe3f8731d33200fea2f97ab64a1b8e68dae0b48c5c1bd9e7485a9905636bc6')

package() {
  cd "${srcdir}/fusepy-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  sed -n '/Copyright/,/ THIS SOFTWARE[.]/p' fuse.py > LICENSE
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:
