# Maintainer: aksr <aksr at t-com dot me>
pkgname=pss-git
pkgver=1.42
pkgrel=1
epoch=
pkgdesc="A power-tool for searching inside source code files."
arch=('i686' 'x86_64')
url="https://github.com/eliben/pss"
license=('BSD')
groups=()
depends=('python2')
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
source=("$pkgname::git+https://github.com/eliben/pss.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//g'
}

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

