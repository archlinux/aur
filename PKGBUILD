pkgname=abinot
pkgver=1.0.0
pkgrel=2
pkgdesc="Abinot Python Script for Arch Linux"
arch=('x86_64')
url="https://www.Abinot.ir/"  # آدرس ریپوی خود را وارد کنید
license=('GPL3')
depends=('bash' 'yay' 'base-devel' 'git' 'python' 'python-pyqt5')
makedepends=('git')
source=("git+https://github.com/abinot/abinot-arch.git")  # آدرس ریپوی شما
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/abinot-arch"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/abinot-arch"
  install -Dm755 "index.py" "$pkgdir/usr/bin/abinot"
}
