# Maintainer: ZaZam <zazaamm ät gmail>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>
# Contributor sumt <sumt at sci dot fi>

pkgname=yle-dl
pkgver=20240429
pkgrel=1
pkgdesc="Download video and audio from YLE Areena."
arch=('any')
url="http://aajanki.github.io/yle-dl/"
license=('GPL3')
depends=('ffmpeg'
       'python-configargparse>=0.13.0'
       'python-lxml'
       'python-requests'
)
optdepends=('wget: for some rare streams'
	'python-xattr'
	'python-psutil'
)
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aajanki/yle-dl/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f6bdd0f1d97edc6bbab5d7ab3af1a01261e9cb2cd05d4feb0a883a4db3afdc0f')


build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
