# Maintainer: Ben Oliver <ben@bfoliver.com>
# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Maintainer: John Jenkins <twodopeshaggy@gmail.com>
# Maintainer: Julian Paul Dasmarinas <julian.dasma@gmail.com>

pkgname=buku
pkgver=4.3
pkgrel=1
pkgdesc="Powerful command-line bookmark manager. CLI only."
arch=('any')
depends=('python' 'python-beautifulsoup4' 'python-cryptography' 'python-urllib3' 'python-certifi' 'python-html5lib')
makedepends=('make')
url="https://github.com/jarun/Buku"
license=('GPL3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/jarun/Buku/tar.gz/v$pkgver)
sha256sums=('4c91cb0ac83164153c65705f46af29aaede78a2ed48d836cd2269b0fc71fed7a')

package() {
  cd "$srcdir/buku-$pkgver"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
  install -Dm644 auto-completion/fish/buku.fish "${pkgdir}/usr/share/fish/vendor_completions.d/buku.fish"
  install -Dm644 auto-completion/bash/buku-completion.bash "${pkgdir}/etc/bash_completion.d/buku"
  install -Dm644 auto-completion/zsh/_buku "${pkgdir}/usr/share/zsh/site-functions/_buku"
}
