# Maintainer: Muflone http://url.muflone.com/contacts

pkgname=cpucompare
pkgver=0.7.0
pkgrel=1
pkgdesc="A GTK+ application to make comparisons between CPU models."
url="http://url.muflone.com/cpucompare"
arch=('any')
license=('GPL2')
depends=('python2' 'gtk3' 'python2-gobject' 'python2-xdg' 'xdg-utils')
provides=('cpucompare')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('4e495f645b94132eb1abb3a224b01e75')
sha1sums=('1f08b473541454ac4df4333bd3352798c4206265')
sha256sums=('260707d70ad917fe8c287d1182498a714c30e3c1224038d7223e1dc8a08a2e37')

build() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --optimize=1 --root "${pkgdir}"
}

