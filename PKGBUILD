# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=fofimon
pkgver=0.12
pkgrel=1
pkgdesc="Monitor selected folders and files for modifications"
url='https://efanomars.com/utilities/fofimon'
arch=('x86_64' 'i686' 'aarch64')
license=('GPL3')

depends=('glibmm')
makedepends=('cmake' 'python')
optdepends=()

#provides=("fofimon")
#replaces=("fofimon")
#conflicts=("fofimon")

source=('https://efanomars.com/sources/fofimon-0.12.tar.gz')
sha256sums=('bc99064ed9705c5ce01d5cdda72c22bb31af793f3c715f6dbf715ea1b2723074')

build() {
  cd "${srcdir}/fofimon"

  ./scripts/install_fofimon.py -b=Release  --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/fofimon"

  ./scripts/priv/dd_install_fofimon.py -b=Release  --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
