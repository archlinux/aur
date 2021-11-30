# Maintainer: Janis Jansons <aur@janhouse.lv>
pkgname=ledfx-git
pkgver=v0.10.5.r50.gb8e68bea
pkgrel=1
pkgdesc="Make your LEDs dance in sync to the music"
arch=('any')
url="https://github.com/LedFx/LedFx"
license=('MIT')
depends=('ffmpeg' 'avahi' 'pulseaudio')
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
