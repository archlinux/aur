# Maintainer: Silvio Ankermann < silvio at booq dot org >

pkgname=git-annex-zshcompletion-git
pkgver=r59.e87e7db
pkgrel=2
pkgdesc="ZSH completion support for git-annex."
arch=('any')
license=('custom:WTFPL')
url='https://github.com/Schnouki/git-annex-zsh-completion'
depends=('zsh' 'git' 'git-annex' 'python>=3.2')
source=("$pkgname::git+https://github.com/Schnouki/git-annex-zsh-completion" LICENSE)
sha512sums=('SKIP'
            '1b4064171fa88f41d05e3d1d1c14ceb8a5cb4cca9e6f08f7e267d7740b7d65e4765cb56f0ccf3765ee9c85654559d2d7726d71516b890b0174b68e6cc62ef421')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd "$srcdir/$pkgname"
  install -d "${pkgdir}/usr/share/zsh/site-functions"
  install -m 0644 "_git-annex" "$pkgdir/usr/share/zsh/site-functions/"
}
