# Maintainer: Michael Taboada <michael@2mb.solutions>

pkgname=pyshaper
pkgver=0.1.3
pkgrel=1
pkgdesc="your easy dynamic traffic shaper"
arch=('any')
url="http://freenet.mcnabhosting.com/python/pyshaper"
license=('GPL2')
depends=("python2")
makedepends=('python2-setuptools')
source=("$url/$pkgname-$pkgver.tar.gz" "$pkgname.diff")
sha512sums=('090561441e1b349072ac8eca7d114f375020683ce174d2ac1fca51f7c7eb2abd0bfae68a00631291c436ea580dd0ecff11b27adc85db6e2da54bed76a1815a12'
            'a0322b8fbfaeaeb96e051a313d9a86ada084c470fd3398992c00cd7d30a838a77fd84488839154c15af004198bda72629b155e0c6815c0b74f2d973673e00785')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i "$srcdir/$pkgname.diff"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
