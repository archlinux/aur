# Maintainer: Michael Armbruster <michael@armbrust.me>
pkgname=recordurbate
pkgver=1.2.0
pkgrel=1
pkgdesc="A Bot to automatically record Chaturbate live streams"
url="https://github.com/maki-chan/Recordurbate"
arch=('any')
license=('GPL3')
depends=('python' 'youtube-dl' 'ffmpeg')
makedepends=('git')
source=("git+https://github.com/maki-chan/Recordurbate.git#tag=1.2.0")
sha256sums=('SKIP')

pkgver() {
  cd "Recordurbate"
  git describe --tags --abbrev=0 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "Recordurbate"
  python setup.py build
}

package() {
  cd "Recordurbate"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build 
}
