# Maintainer: Dan Johansen <strit@manjaro.org>
# Contributor: Shaber

pkgname=corefm
pkgver=4.0.0
pkgrel=1
pkgdesc="A lightwight filemanager from the CoreApps family."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/$pkgname"
license=('GPL3')
depends=('qt5-base' 'libcprime>=2.7.1' 'libcsys>=2.7.1')
groups=('coreapps')
source=("https://gitlab.com/cubocore/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
md5sums=('3299257bd91d0ca7897695b548709c22')

prepare() {
  mkdir -p build
}

build() {
  cd ${pkgname}-v${pkgver}

  qmake-qt5 ${pkgname}.pro
  make
}

package() {
  cd ${pkgname}-v${pkgver}
  make INSTALL_ROOT=${pkgdir} install
}
