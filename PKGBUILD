pkgname=meson-cmake-wrapper-git
pkgver=r106.d09f2b0
pkgrel=1
pkgdesc="Build system wrapper that provides Meson integration in CMake IDE's."
arch=('any')
url="https://github.com/prozum/meson-cmake-wrapper"
license=('MIT')
depends=('python' 'meson' 'cmake')
source=("git://github.com/prozum/meson-cmake-wrapper.git")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

