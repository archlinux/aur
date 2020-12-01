# Maintainer: Dan Johansen <strit@manjaro.org>
# Contributor: Shaber

pkgname=coreinfo
pkgver=4.1.0
pkgrel=1
pkgdesc="A file information tool from the CoreApps family."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/coreapps/$pkgname"
license=('GPL3')
depends=('qt5-base' 'libcprime>=2.7.1' 'libmediainfo' 'zlib')
groups=('coreapps')
source=("https://gitlab.com/cubocore/coreapps/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
md5sums=('213fa4f71f1f53792bacb80caf57c271')

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
