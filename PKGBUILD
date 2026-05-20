# Maintainer: kbity <bit161660@gmail.com>
pkgname='wbij'
pkgver=0.2.1
pkgrel=2
pkgdesc="a CLI tool for wbijanie zadań"
arch=('x86_64')
url="https://repos.adamm.rocks/maleszka/wbij"
license=('GPL-2.0-or-later')
depends=('fzf')
makedepends=('zig0.15')
conflicts=('wbij-bin')
source=("${pkgname}-${pkgver}.tar.gz::https://repos.adamm.rocks/maleszka/wbij/archive/v${pkgver}.tar.gz")
sha256sums=('43884295847439a8dbae4146eb8383b9e781c26c4003dd7dde0774d6e661135a')

build() {
  cd "${srcdir}/${pkgname}"
  zig build -Doptimize=ReleaseSafe
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 zig-out/bin/wbij "${pkgdir}/usr/bin/wbij"
}
