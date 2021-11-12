# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Contributor: The Tango Controls community
#              (https://tango-controls.org) <info@tango-controls.org>

pkgname=tango-idl
pkgver=5.1.0
pkgrel=1
pkgdesc="This is the Tango CORBA IDL file."
arch=('any')
url="https://www.tango-controls.org/"
license=('GPL3')
depends=('cmake>=2.8.9')
conflicts=('tango-idl-git')
source=("https://gitlab.com/tango-controls/tango-idl/-/archive/${pkgver}/tango-idl-${pkgver}.tar.gz")
sha256sums=('864dc73510fea5d71c8d7120ecb0d0df13510b37319120367305b94490b5751e')
_dir="${pkgname}-${pkgver}"

prepare() {
  mkdir -p ${_dir}/build
}

build() {
  cd ${_dir}/build
  cmake ../
}

package() {
  cd ${_dir}/build
  make DESTDIR=${pkgdir} install
}
