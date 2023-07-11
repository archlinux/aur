pkgname=dr_libs-git
pkgver=r2411.e07e2b8
pkgrel=1
pkgdesc='Audio decoding libraries for C/C++, each in a single source file.'
arch=(any)
url=https://github.com/mackron/dr_libs
license=(MIT)
makedepends=(git)
source=(git+https://github.com/mackron/dr_libs)
b2sums=(SKIP)
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")

pkgver() {
  cd dr_libs
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  install -Dm 644 dr_libs/*.h -t "${pkgdir}"/usr/include/dr_libs/
  install -Dm 644 dr_libs/LICENSE -t "${pkgdir}"/usr/share/licenses/dr_libs/
}

# vim: ts=2 sw=2 et:

