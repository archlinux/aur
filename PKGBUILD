# Maintainer: Janis Jansons <aur@janhouse.lv>
pkgname=python-pyaudio-git
pkgver=v0.2.11.r2.gf749f21
pkgrel=1
pkgdesc="Python bindings for PortAudio (Fork to fix PY_SSIZE_T_CLEAN error)"
arch=('x86_64')
url="https://git.skeh.site/skeh/pyaudio"
license=('MIT')
depends=('portaudio' 'python')
provides=('python-pyaudio')
conflicts=('python-pyaudio')
makedepends=('git')
source=("python-pyaudio-git::git+https://git.skeh.site/skeh/pyaudio.git")
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
    python setup.py install --root="$pkgdir" --optimize=1
}
