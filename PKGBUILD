pkgname=whatlastgenre-git
pkgver=20220707.g05a1b4d87183cc23c6fb2b4719e23268ed118f2c
pkgrel=1
pkgdesc='Improve genre metadata of audio files based on tags from various music sites.'
arch=(any)
url='https://github.com/YetAnotherNerd/whatlastgenre'
license=(MIT)
depends=(python python-mutagen python-requests python-rauth)
makedepends=(git python-setuptools)
source=('git+https://github.com/YetAnotherNerd/whatlastgenre.git')
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  date +"%Y%m%d"."g$(git rev-parse HEAD)"
}

build() {
  cd whatlastgenre
  python setup.py build sdist
}

package() {
  cd whatlastgenre
  python setup.py install --root="${pkgdir}" --optimize=1
}
