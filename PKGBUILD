# Maintainer: lmartinez-mirror
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
pkgname=vim-securemodelines-git
pkgver=r21.0e1b902
pkgrel=1
pkgdesc='Secure, user-configurable modeline support for (Neo)Vim'
arch=('any')
url="http://github.com/chriscroome/securemodelines"
license=('custom:vim')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url"
        'license.txt')
sha256sums=('SKIP'
            '17b84c8f97d20ea5b8a7eff68f9b872e195137691d231aadc0e7fc4ca7a5b946')

pkgver()  {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  install -Dm 644 plugin/securemodelines.vim "$pkgdir/usr/share/vim/vimfiles/plugin/securemodelines.vim"
  install -Dm 644 "$srcdir/license.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

# vim:set ts=2 sw=2 et:
