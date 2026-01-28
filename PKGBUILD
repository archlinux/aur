# Maintainer: ZaZam <zazaamm ät gmail>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>
# Contributor sumt <sumt at sci dot fi>

pkgname=yle-dl
pkgver=20250730
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/aajanki/yle-dl/archive/refs/tags/releases/${pkgver}.tar.gz")
sha256sums=('4aab34faaba6f0d5bd9d1e93ea3e85a9021f3ab1d010c166c1569fe7bf4d98da')


build() {
  cd $pkgname-releases-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-releases-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
