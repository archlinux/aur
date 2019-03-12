# Maintainer: morguldir <morguldir@protonmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=python2-evdev
pkgver=1.1.2
pkgrel=1
pkgdesc="Python2 bindings for the Linux input subsystem"
arch=(x86_64)
url="https://python-evdev.readthedocs.io/en/latest/"
license=(BSD)
makedepends=(python2 git)
_commit=34a7535e8e160c78bf923adc48a1f1f6bcdcaae8  # tags/v1.1.2
source=("git+https://github.com/gvalkov/python-evdev#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd python-evdev
  git describe --tags | sed 's/^v//;s/-/+/g'
}

build() {
  cd python-evdev
  python2 setup.py build
}

package() { 
  cd python-evdev
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dt "$pkgdir/usr/share/licenses/python2-evdev" -m644 LICENSE
}
