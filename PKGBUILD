# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=wordfence-cli
pkgver=2.0.3
pkgrel=1
pkgdesc="A modern and fast real-time MIDI player written in Rust."
url="https://github.com/wordfence/wordfence-cli"
arch=('any')
license=('GPL3')
depends=(python python-packaging python-requests)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wordfence/wordfence-cli/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('d31fc3b368005933190fbd543fcd88b6100c356bb07c7e3202f844b38d8439ef02c83741ff8e7b520d90a4687c74b85a155f382e3b51427921bb3323c1d56c6e')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
