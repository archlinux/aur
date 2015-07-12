# Maintainer: aksr <aksr at t-com dot me>
pkgname=blueshift-git
pkgver=1.90.3.r1.g3f2d049
pkgrel=1
epoch=
pkgdesc="An extensible and highly configurable alternative to redshift."
arch=('i686' 'x86_64')
url="https://github.com/maandree/blueshift"
license=('GPL')
groups=()
depends=('python' 'pylibgamma' 'solar-python' 'argparser' 'libxcb' 'adjbacklight' 'wget' 'auto-auto-complete')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/maandree/blueshift")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" LIBEXEC="/lib/blueshift/" install
}

