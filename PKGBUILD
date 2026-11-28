# Maintainer: Santiago Burgos <santiago.burgos1089@gmail.com>

pkgname=mint-translations
pkgver=2026.11.25
_commit=1d2c9be12920b3787a06e9152316f8286f26c0fc
pkgrel=1
pkgdesc="Translation files for Linux Mint applications"
arch=('x86_64')
url="https://github.com/linuxmint/$pkgname"
license=('GPL-3.0-or-later')
makedepends=(
    'git'
    'python'
    'python-rich'
)
source=("git+${url}.git#commit=${_commit}")
sha256sums=('5746f0f2bbfe196dd8b49c7a105464816af3d987c9360888e348d379c57fa718')

build() {
  cd "$srcdir/${pkgname}"
  ./1-clean.sh
  make clean
  make 
}

package() {
	cp -rf "${srcdir}/${pkgname}/usr" ${pkgdir}
}
