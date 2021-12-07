_pkgname=mdloader
pkgname=$_pkgname-git
pkgver=1.0.6.r0.ge4f9774
pkgrel=1
pkgdesc='Massdrop Firmware Loader - for CTRL / ALT / SHIFT / Rocketeer keyboards'
arch=('i686' 'x86_64')
url="https://github.com/Massdrop/mdloader"
license=('GPL3')
groups=()
depends=('glibc')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-bin")
source=("$_pkgname::git+https://github.com/Massdrop/mdloader.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  install -D build/$_pkgname $pkgdir/usr/bin/$_pkgname
}

