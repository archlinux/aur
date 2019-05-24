# Maintainer: Ben Oliver <ben@bfoliver.com>
# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Maintainer: John Jenkins <twodopeshaggy@gmail.com>
# Maintainer: Julian Paul Dasmarinas <julian.dasma@gmail.com>

pkgname=buku
pkgver=4.2.2
pkgrel=1
pkgdesc="Powerful command-line bookmark manager."
arch=('any')
depends=('python' 'python-beautifulsoup4' 'python-cryptography' 'python-urllib3' 'python-certifi' 'python-html5lib')
makedepends=('make')
url="https://github.com/jarun/Buku"
license=('GPL3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/jarun/Buku/tar.gz/v$pkgver)
sha256sums=('08866f284a03454d9ee5bbb332da62e6ae1dfbe83ada75092453a7fd04fe62b3')

package() {
  cd "$srcdir/Buku-$pkgver"
  install -Dm 644 $pkgname.1 "${pkgdir}/usr/share/man/man1/$pkgname.1"
  python setup.py install --root="${pkgdir}" --prefix=/usr
  install -Dm644 auto-completion/fish/buku.fish "${pkgdir}/usr/share/fish/vendor_completions.d/buku.fish"
  install -Dm644 auto-completion/bash/buku-completion.bash "${pkgdir}/etc/bash_completion.d/buku"
  install -Dm644 auto-completion/zsh/_buku "${pkgdir}/usr/share/zsh/site-functions/_buku"
}
