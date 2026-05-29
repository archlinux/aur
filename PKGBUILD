# maintainer: aray4iv3 <aray.4iv3@gmail.com>
pkgname=smosummary
pkgver=4.0.1
pkgrel=3
pkgdesc="A Sum of Best (SoB) calculator and Stopwatch for Super Mario Odyssey speedrunners"
arch=('x86_64')
source=("smosummary::git+https://github.com/aray4iv3/smosummary.git")
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake' 'ninja' 'git') # Added ninja and git here
sha256sums=('SKIP')
provides=('smosummary')
conflicts=('smosummary-bin' 'smosummary-git')

build() {
  cd "$srcdir/$pkgname"
  cmake -B build -S . -G Ninja -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 build/smosummary "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
