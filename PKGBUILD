# Maintainer: Sergey Safonov <spoof-arch@spoofa.info>
pkgname=jefferson
pkgver=0.4.7
pkgrel=1
pkgdesc="JFFS2 filesystem extraction tool"
url="https://github.com/onekey-sec/jefferson"
arch=(any)
license=(MIT)
depends=(
    'python>=3.10'
    'python-dissect.cstruct>=4.4' 
    'python-dissect.cstruct<5' 

    'python-lzallright>=0.2.1'
    'python-lzallright<0.3'

    'python-click>=8.1'
    'python-click<9'
)
makedepends=(python-{build,installer,wheel})
provides=(${pkgname})
conflicts=("${pkgname}-git")
source=("https://github.com/onekey-sec/jefferson/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('14fd8827f4d1b6f7b3fdc41c89994d845bab597d87c623753b9e559488e9f2b1')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/$pkgname-$pkgver-*.whl
}
