# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=ddgr
pkgver=1.1
pkgrel=1
pkgdesc="DuckDuckGo from the terminal"
arch=('any')
url="https://github.com/jarun/ddgr"
license=('GPL3')
depends=('python')
conflicts=('ddgr-git')
source=("https://github.com/jarun/ddgr/archive/v$pkgver.tar.gz")
md5sums=('4bba45f2391f0b050b2d6764275136f1')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 ddgr "${pkgdir}/usr/bin/ddgr"
  install -Dm644 ddgr.1 "${pkgdir}/usr/share/man/man1/ddgr.1"
  install -Dm644 auto-completion/fish/ddgr.fish "${pkgdir}/usr/share/fish/vendor_completions.d/ddgr.fish"
  install -Dm644 auto-completion/bash/ddgr-completion.bash "${pkgdir}/etc/bash_completion.d/ddgr"
  install -Dm644 auto-completion/zsh/_ddgr "${pkgdir}/usr/share/zsh/site-functions/_ddgr"
}
