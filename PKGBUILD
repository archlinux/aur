# Maintainer: João Figueiredo <islandc0der@chaotic.cx>

pkgname=fftool-git
pkgver=r175.0bf8a80
pkgrel=1
pkgdesc='Tool to build force field input files for molecular simulation'
arch=(any)
url='https://github.com/paduagroup/fftool'
license=(MIT)
depends=(python)
optdepends=("packmol: to pack molecules and materials in the simulation box")
makedepends=(git)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${pkgname%-git}
  install -Dm755 fftool lattice xyztool -t "$pkgdir/usr/bin/"
  install -Dm644 examples/* -t "$pkgdir/usr/share/${pkgname%-git}/examples/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
