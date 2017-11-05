# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=ddgr
pkgver=1.0
pkgrel=1
pkgdesc="DuckDuckGo from the terminal"
arch=('any')
url="https://github.com/jarun/ddgr"
license=('GPL3')
depends=('python')
conflicts=('ddgr-git')
source=("https://github.com/jarun/ddgr/archive/v$pkgver.tar.gz")
md5sums=('34e6934d688c720630c46c1bd595bf5a')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 ddgr "${pkgdir}/usr/bin/ddgr"
  install -Dm644 ddgr.1 "${pkgdir}/usr/share/man/man1/ddgr.1"
  install -Dm644 auto-completion/fish/ddgr.fish "${pkgdir}/usr/share/fish/vendor_completions.d/ddgr.fish"
  install -Dm644 auto-completion/bash/ddgr-completion.bash "${pkgdir}/etc/bash_completion.d/ddgr"
  install -Dm644 auto-completion/zsh/_ddgr "${pkgdir}/usr/share/zsh/site-functions/_ddgr"
}
