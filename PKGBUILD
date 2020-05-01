# Maintainer: Pablo Arias <pabloariasal@gmail.com>
# Contributor: John Jenkins <twodopeshaggy@gmail.com>

pkgname=ddgr
pkgver=1.8.1
pkgrel=1
pkgdesc="DuckDuckGo from the terminal"
arch=('any')
url="https://github.com/jarun/ddgr"
license=('GPL3')
depends=('python')
conflicts=('ddgr-git')
source=("https://github.com/jarun/ddgr/archive/v$pkgver.tar.gz")
sha256sums=('d223a3543866e44e4fb05df487bd3eb23d80debc95f116493ed5aad0d091149e')

package() {
  make -C "${pkgname}-${pkgver}" DESTDIR="${pkgdir}" PREFIX="/usr" install

  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 auto-completion/fish/ddgr.fish "${pkgdir}/usr/share/fish/vendor_completions.d/ddgr.fish"
  install -Dm644 auto-completion/bash/ddgr-completion.bash "${pkgdir}/etc/bash_completion.d/ddgr"
  install -Dm644 auto-completion/zsh/_ddgr "${pkgdir}/usr/share/zsh/site-functions/_ddgr"
}
