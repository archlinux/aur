# Maintainer: ZaZam <zazaamm ät gmail>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>
# Contributor sumt <sumt at sci dot fi>

pkgname=yle-dl
pkgver=20260520
pkgrel=1
pkgdesc="Download video and audio from YLE Areena."
arch=('any')
url="http://aajanki.github.io/yle-dl/"
license=('GPL3')
depends=(
  'ffmpeg'
  'python-configargparse>=0.13.0'
  'python-lxml'
  'python-requests'
)
optdepends=(
  'wget: for some rare streams'
  'python-xattr'
  'python-psutil'
)
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aajanki/yle-dl/archive/refs/tags/releases/${pkgver}.tar.gz")
sha256sums=('75facbf1092a0d1f6504be1c2f4441c9708548f78601aeb0c8df4bed1020c003')


build() {
  cd $pkgname-releases-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-releases-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
