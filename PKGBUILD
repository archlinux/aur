pkgname=repoconductor-bin
pkgver=1.4.0
pkgrel=1
pkgdesc='Tool to manage multiple repositories'
arch=('x86_64')
url='https://github.com/shichirouji21/RepoConductor'
license=('BSD-2-Clause')
provides=('repoconductor')
conflicts=('repoconductor' 'repoconductor-git')
source=("$pkgname-$pkgver::${url}/releases/download/v${pkgver}/repoconductor"
        "${url}/releases/download/v${pkgver}/repoconductor-completions-${pkgver}.tar.gz")
noextract=("$pkgname-$pkgver")
sha256sums=('f3b7ba5be4f966d6525cebfdd5b5a2e567b87c30dbede78e7e7df13f4d7f13f8'
            'c51137509c576a8636b01b443010cd9fc0a1e8f46d0029616ca6b270a0410a55')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver" \
                 "$pkgdir/usr/bin/repoconductor"

  install -Dm644 "$srcdir/completions/repoconductor.bash" \
                 "$pkgdir/usr/share/bash-completion/completions/repoconductor"
  install -Dm644 "$srcdir/completions/_repoconductor" \
                 "$pkgdir/usr/share/zsh/site-functions/_repoconductor"
  install -Dm644 "$srcdir/completions/repoconductor.fish" \
                 "$pkgdir/usr/share/fish/vendor_completions.d/repoconductor.fish"
}
