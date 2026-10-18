# Maintainer: Sergey Safonov <spoof-arch@spoofa.info>
pkgname=jefferson
pkgver=0.4.8
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
sha256sums=('c354ed91590ffaf982e0c100733c3c594be7e068262fbc91bc5ed0848867e46e')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/$pkgname-$pkgver-*.whl
}
