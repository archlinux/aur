# Maintainer: Cem Kaya<cemkaya.boun@gmail.com>
# Contributor: Cem Kaya <cemkaya.boun@gmail.com>
pkgname=dell-g15-controller
pkgver=2.0
pkgrel=1
pkgdesc="AWCC alternative for Dell G15 with keyboard backlight control, power mode control and fan control."
arch=('x86_64')
url="https://github.com/cemkaya-mpi/Dell-G15-Controller"
license=('GPLv3')
groups=()
depends=('python' 'python-pyusb' 'pyside6' 'python-pexpect' 'polkit')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::https://github.com/cemkaya-mpi/Dell-G15-Controller/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('fa4489fffb496e846ae88c16e33323de6256420186ba071e6ee9e0f256e77513')

package() {
  cd "${srcdir}/Dell-G15-Controller-$pkgver"
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
  cp "dell-g15-controller.desktop" "$pkgdir/usr/share/applications/dell-g15-controller.desktop"

#   make DESTDIR="$pkgdir/" install
}
