# Maintainer: lmartinez-mirror
pkgname=vim-colors-spring-night-git
pkgver=r228.8e0e889
pkgrel=1
pkgdesc="A low-contrast calm color scheme for Vim"
arch=('any')
url="https://github.com/rhysd/vim-color-spring-night"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
optdepends=('vim-airline')
makedepends=('git')
source=("$pkgname::git+$url"
        "LICENSE")
sha256sums=(
  'SKIP'
  'c268c4f5894d19260aedd79dc1dc39ba098b3cbb02eaa4af7a1d0d4faea1837d')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  find autoload colors -type f -exec install -Dm 644 '{}' \
    "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dm 444 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
