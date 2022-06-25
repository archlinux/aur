# Maintainer: Robin Candau <robincandau@protonmail.com>
# Contributor: Pablo Arias <pabloariasal@gmail.com>
# Contributor: John Jenkins <twodopeshaggy@gmail.com>

pkgname=ddgr
pkgver=2.0
pkgrel=1
pkgdesc="DuckDuckGo from the terminal"
arch=('any')
url="https://github.com/jarun/ddgr"
license=('GPL3')
depends=('python')
conflicts=('ddgr-git')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('7e46430b0a8c479a5feca832adb73f2f09804bf603dedc50f4cf2e1da4c75f88')

package() {
  make -C "${pkgname}-${pkgver}" DESTDIR="${pkgdir}" PREFIX="/usr" install

  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 auto-completion/fish/ddgr.fish "${pkgdir}/usr/share/fish/vendor_completions.d/ddgr.fish"
  install -Dm644 auto-completion/bash/ddgr-completion.bash "${pkgdir}/etc/bash_completion.d/ddgr"
  install -Dm644 auto-completion/zsh/_ddgr "${pkgdir}/usr/share/zsh/site-functions/_ddgr"
}
