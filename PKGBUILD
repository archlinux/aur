# Maintainer: Dan Johansen <strit@manjaro.org>
# Contributor: Shaber

pkgname=corepdf
pkgver=4.1.0
pkgrel=1
pkgdesc="A PDF viewer from the CoreApps family."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/coreapps/$pkgname"
license=('GPL3')
depends=('qt5-base' 'poppler-qt5' 'libcprime>=2.7.1')
groups=('coreapps')
source=("https://gitlab.com/cubocore/coreapps/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
md5sums=('1d9809c55469a0a408617cfb2a1a4b3f')

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
