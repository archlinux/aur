# Maintainer: Cem Kaya<cemkaya.boun@gmail.com>
# Contributor: Cem Kaya <cemkaya.boun@gmail.com>
pkgname=dell-g15-ledcontrol
pkgver=1.0
pkgrel=1
pkgdesc="GUI RGB led controller for dell g15 and some other alienware laptops."
arch=('x86_64')
url="https://github.com/cemkaya-mpi/Dell-G15-LedControl"
license=('GPLv3')
groups=()
depends=('python' 'python-pyusb' 'pyside6')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::https://github.com/cemkaya-mpi/Dell-G15-LedControl/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('b8c6a9f53844a07d8a3515aafcfdd0b0abdfc3c415622d0e7a60792045c55981')

package() {
  cd "${srcdir}/Dell-G15-LedControl-$pkgver"
  #Create Directories
  install -d "$pkgdir/opt/$pkgname/"
  install -d "$pkgdir/etc/udev/rules.d/"
  install -d "$pkgdir/usr/share/applications/"
  #Udev rule
  cp "00-aw-elc.rules" "$pkgdir/etc/udev/rules.d/00-aw-elc.rules"
  #Copy files
  cp "awelc.py" "$pkgdir/opt/$pkgname/awelc.py"
  cp "elc_constants.py" "$pkgdir/opt/$pkgname/elc_constants.py"
  cp "elc.py" "$pkgdir/opt/$pkgname/elc.py"
  cp "hidreport.py" "$pkgdir/opt/$pkgname/hidreport.py"
  cp "main.py" "$pkgdir/opt/$pkgname/main.py"
  #Install desktop entry
  cp "dell-g15-ledcontrol.desktop" "$pkgdir/usr/share/applications/dell-g15-ledcontrol.desktop"

#   make DESTDIR="$pkgdir/" install
}
