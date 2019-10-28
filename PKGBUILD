# Maintainer: Ranieri Althoff <ranisalt+aur at gmail dot com>

pkgname=amdgpu-clocks-git
pkgver=r14.4cfd488
pkgrel=1
pkgdesc='Simple script to control power states of amdgpu driven GPUs'
url='https://github.com/sibradzic/amdgpu-clocks'
license=('GPL2')
arch=('any')
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
depends=('bash')
source=("${pkgname}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  install -Dm755 amdgpu-clocks "$pkgdir/usr/bin/amdgpu-clocks"
  install -Dm644 amdgpu-clocks.service "$pkgdir/usr/lib/systemd/system/amdgpu-clocks.service"
}
