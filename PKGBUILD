# Maintainer: Luís Ferreira <contact@lsferreira.net>
# Contributor: Iwan Timmer <irtimmer@gmail.com>

pkgname=vulkan-hpp-git
pkgver=r220.9efc002
pkgrel=1
pkgdesc="C++ Bindings for Vulkan"
groups=('vulkan-devel')
arch=('any')
url="https://github.com/KhronosGroup/Vulkan-Hpp"
license=('Apache')
provides=('vulkan-hpp')
conflicts=('vulkan-hpp')
depends=('vulkan-headers')
source=('git+https://github.com/KhronosGroup/Vulkan-Hpp.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Vulkan-Hpp"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -dm755 "$pkgdir/usr/include/vulkan/"
  install -Dm644 "$srcdir/Vulkan-Hpp/vulkan/vulkan.hpp" "$pkgdir/usr/include/vulkan/vulkan.hpp"
  install -Dm644 "$srcdir/Vulkan-Hpp/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
