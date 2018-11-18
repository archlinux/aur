# Maintainer: Pablo Arias <pabloariasal@gmail.com>
# Contributor: John Jenkins <twodopeshaggy@gmail.com>

pkgname=ddgr
pkgver=1.6
pkgrel=1
pkgdesc="DuckDuckGo from the terminal"
arch=('any')
url="https://github.com/jarun/ddgr"
license=('GPL3')
depends=('python')
conflicts=('ddgr-git')
source=("https://github.com/jarun/ddgr/archive/v$pkgver.tar.gz")
sha256sums=('eae7ff1ab44dfda168a8bbe46593e80ca4a26ab45a9efbab13e6f466349e0e5c')

package() {
  make -C "${pkgname}-${pkgver}" DESTDIR="${pkgdir}" PREFIX="/usr" install

  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 auto-completion/fish/ddgr.fish "${pkgdir}/usr/share/fish/vendor_completions.d/ddgr.fish"
  install -Dm644 auto-completion/bash/ddgr-completion.bash "${pkgdir}/etc/bash_completion.d/ddgr"
  install -Dm644 auto-completion/zsh/_ddgr "${pkgdir}/usr/share/zsh/site-functions/_ddgr"
}
