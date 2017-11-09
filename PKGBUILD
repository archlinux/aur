# Maintainer: Silvio Ankermann < silvio at booq dot org >

pkgname=git-annex-zshcompletion-git
pkgver=r59.e87e7db
pkgrel=1
pkgdesc="ZSH completion support for git-annex."
arch=('any')
url='https://github.com/Schnouki/git-annex-zsh-completion'
depends=('zsh' 'git' 'git-annex' 'python>=3.2')
source=("$pkgname::git+https://github.com/Schnouki/git-annex-zsh-completion")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  install -d "${pkgdir}/usr/share/zsh/site-functions"
  install -m 0644 "_git-annex" "$pkgdir/usr/share/zsh/site-functions/"
}
