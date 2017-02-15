# Maintainer: Franek Madej <franek.madej@gmail.com>
pkgname=yadm-git
pkgver=1.07.r1.ga78fe20
pkgrel=1
pkgdesc="Yet Another Dotfiles Manager"
arch=('any')
url="https://github.com/TheLocehiliosan/yadm"
license=('GPL')
groups=()
depends=()
makedepends=('git')
optdepends=()
provides=('yadm')
conflicts=('yadm')
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+https://github.com/TheLocehiliosan/yadm#branch=master")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe  --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${srcdir}/${_pkgname}
}

package() {
  cd $srcdir/$pkgname
  install -D -m 755 yadm $pkgdir/usr/bin/yadm
  install -D -m 644 yadm.1 $pkgdir/usr/share/man/man1/yadm.1
}
