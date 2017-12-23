# Maintainer: Ben Ruijl <benruyl@gmail.com>

pkgname=python2-sabyenc
pkgver=3.3.2
pkgrel=1
pkgdesc="Python2 yEnc package optimized for use within SABnzbd"
url="https://github.com/sabnzbd/sabyenc"
arch=('i686' 'x86_64' 'armv7h')
license=("GPL")
depends=("python2")
makedepends=("python2-setuptools")

source=("https://github.com/sabnzbd/sabyenc/archive/v${pkgver}.tar.gz")
md5sums=('2163720fcc74691722846d0e28a8e7e0')

build() {
  cd "${srcdir}/sabyenc-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/sabyenc-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
