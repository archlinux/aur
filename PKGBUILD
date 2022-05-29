# Maintainer: Maciej Balajewicz <mbalajew at illinois dot edu>

pkgname=vim-solarized8-git
pkgver=1.4.0.r3.g9f9b795
pkgrel=1
pkgdesc="Optimized Solarized colorschemes. Best served with true-color terminals!"
arch=('any')
url="https://ethanschoonover.com/solarized"
license=('MIT')
makedepends=('git')
depends=('vim')
conflicts=('vim-solarized8')
provides=('vim-solarized8')
source=("$pkgname::git+https://github.com/lifepillar/vim-solarized8.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$pkgname"
  find colors doc -type f -exec \
    install -Dm 644 '{}' "${pkgdir}/usr/share/vim/vimfiles/{}" \;
}
