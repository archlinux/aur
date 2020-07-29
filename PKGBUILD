# Maintainer: Maciej Balajewicz <mbalajew at illinois dot edu>

pkgname=vim-solarized8-git
pkgver=1.2.0.r3.g5df7666
pkgrel=1
pkgdesc="Optimized Solarized colorschemes. Best served with true-color terminals!"
arch=('any')
url="http://ethanschoonover.com/solarized"
license=('MIT')
makedepends=('git')
depends=('vim')
conflicts=('vim-solarized8')
provides=('vim-solarized8')
source=("$pkgname::git://github.com/lifepillar/vim-solarized8.git")
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
