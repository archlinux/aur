# Maintainer: f4iey <f4iey@f4iey.fr>	

pkgname=not1mm-git
pkgver=r557.86c9f0e
pkgrel=1
pkgdesc="Not1MM != N1MM, An amateur radio contest logger for Linux."
arch=('any')
license=('GPL3')
url="https://github.com/mbridak/not1mm"
makedepends=('python-pip' 'python-setuptools' 'python-build')
depends=('python' 'python-pyqt5' 'portaudio' 'python-numpy')
source=($pkgname::"git+$url.git")
sha256sums=('SKIP')

 pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/$pkgname
  python -m build
}

package() {
  cd $srcdir/$pkgname
  pip install -e . --root="$pkgdir"
}
