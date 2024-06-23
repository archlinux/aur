# Maintainer: emilylime <emilyyyylime+aur@gmail.com>
# Contributor: Thomas Simatic <thomas.sim@mailo.com>
pkgname="sway-scratchpad-git"
pkgver=2.0
pkgrel=1
pkgdesc="The Swiss Army Knife of floating i3/Sway windows"
arch=(any)
url="https://github.com/emilyyyylime/sway-scratchpad"
license=('Unlicense')
depends=(bash jq coreutils)
makedepends=(git)
optdepends=()
provides=(i3-scratchpad-git)

source=("git+https://github.com/emilyyyylime/sway-scratchpad.git")
md5sums=(SKIP)

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | sed "s+-+.r+" | tr - .
}

package() {
    cd ${pkgname%-git}
    install -Dm 755 ${pkgname%-git} -t "$pkgdir"/usr/bin
}
