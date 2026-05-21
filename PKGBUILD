# Maintainer: Valen <valen@users.noreply.github.com>

pkgname=yuri
pkgver=0.1.0.r34.g9f8f8cc
pkgrel=1
pkgdesc='yuri straight in your terminal'
arch=('any')
url='https://github.com/vlensys/yuri'
license=('unknown')
depends=('python')
makedepends=('git' 'python-setuptools')
optdepends=(
  'mpv: anime playback'
)
source=('git+https://github.com/vlensys/yuri.git')
sha256sums=('SKIP')

pkgver() {
  cd yuri
  printf '%s.r%s.g%s' "$(python setup.py --version)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd yuri
  python setup.py build
}

package() {
  cd yuri
  python setup.py install --root="$pkgdir" --optimize=1
}
