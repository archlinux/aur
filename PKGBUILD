pkgname=wllvm-git
pkgver=r365.189fab4
pkgrel=1
pkgdesc="A wrapper script to build whole-program LLVM bitcode files."
arch=('any')
url="https://github.com/travitch/whole-program-llvm"
license=('MIT')
depends=('python3')
makedepends=('git')
source=("$pkgname"::'git+https://github.com/travitch/whole-program-llvm.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
}

package() {
   cd "$srcdir/$pkgname"
   python3 setup.py install --root="$pkgdir/"
}
