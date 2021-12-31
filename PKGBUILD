# Maintainer: Janis Jansons <aur@janhouse.lv>
pkgname=ledfx-git
pkgver=v0.10.7.r2.g138c2eb1
pkgrel=1
pkgdesc="Make your LEDs dance in sync to the music"
arch=('any')
url="https://github.com/LedFx/LedFx"
license=('MIT')
depends=('ffmpeg' 'avahi' 'pulseaudio' 'python-pyaudio-git')
provides=('ledfx')
conflicts=('ledfx')
makedepends=('git' 'python-setuptools' 'portaudio' 'ffmpeg')
source=("ledfx-git::git+https://github.com/LedFx/LedFx.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $srcdir/$pkgname
    python setup.py build
}

package() {
    cd $srcdir/$pkgname
    python setup.py install --root="$pkgdir"
}
