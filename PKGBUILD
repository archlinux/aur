# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=buku
pkgver=3.2
pkgrel=3
pkgdesc="cmdline bookmark management utility written in Python3 and SQLite3"
arch=('any')
depends=('python' 'python-beautifulsoup4' 'python-cryptography' 'python-requests' 'python-urllib3')
makedepends=('make')
url="https://github.com/jarun/Buku"
license=('GPL3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/jarun/Buku/tar.gz/v$pkgver)
sha256sums=('2375fc22e7e417fe23814589257f007cfdc1b1e3f8e47619a7d6e83ff0fb4f09')

package() {
  cd "$srcdir/Buku-$pkgver"
  install -Dm 644 $pkgname.1 "${pkgdir}/usr/share/man/man1/$pkgname.1"
  python setup.py install --root="${pkgdir}" --prefix=/usr
  install -Dm644 auto-completion/fish/buku.fish "${pkgdir}/usr/share/fish/vendor_completions.d/buku.fish"
  install -Dm644 auto-completion/bash/buku-completion.bash "${pkgdir}/etc/bash_completion.d/buku"
  install -Dm644 auto-completion/zsh/_buku "${pkgdir}/usr/share/zsh/site-functions/_buku"
}
