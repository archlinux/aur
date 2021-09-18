# Maintainer: ZaZam <zazaamm ät gmail>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>
# Contributor sumt <sumt at sci dot fi>

pkgname=yle-dl
pkgver=20210917
pkgrel=1
pkgdesc="Download video and audio from YLE Areena."
arch=('any')
url="http://aajanki.github.io/yle-dl/"
license=('GPL3')
depends=('ffmpeg'
       'python-attrs>=18.1.0'
       'python-configargparse>=0.13.0'
       'python-lxml'
       'python-requests'
)
optdepends=('wget: for some rare streams')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aajanki/yle-dl/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('279d2d877eb42cc2016356902920c2bd5ce4becdae64ec8fc24eb94434cd8c3b')


build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
