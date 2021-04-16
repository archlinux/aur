# Maintainer: lmartinez-mirror
pkgname=vim-vifm-git
pkgver=0.11.r72.g1fec4a02
pkgrel=1
pkgdesc="Vim plugin that allows use of vifm as a file picker"
arch=('any')
url="https://github.com/vifm/vifm.vim"
license=('unknown')
groups=('vim-plugins')
depends=('vim-plugin-runtime' 'vifm')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
  cd "$pkgname"
  find autoload doc ftdetect ftplugin plugin syntax \
    -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
}
