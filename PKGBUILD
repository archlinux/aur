# Maintainer: Ben Ruijl <benruyl@gmail.com>

pkgname=python2-sabyenc
pkgver=3.0.2
pkgrel=3
pkgdesc="Python2 yEnc package optimized for use within SABnzbd"
url="https://github.com/sabnzbd/sabyenc"
arch=('i686' 'x86_64' 'armv7h')
license=("GPL")
depends=("python2")
makedepends=("python2-setuptools")

source=("https://github.com/sabnzbd/sabyenc/archive/v${pkgver}.tar.gz")
md5sums=('49684574e411ee36cc96e8b70aa99ad9')

build() {
  cd "${srcdir}/sabyenc-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/sabyenc-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
