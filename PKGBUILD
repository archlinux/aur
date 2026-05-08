pkgname=repoconductor-bin
pkgver=1.2.0
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
sha256sums=('849a5131ac880f1e823ec7552729aae24345adc151ec8e0da3de1f1563393a7a'
            '5eb5e59ba9bf18a58657a28358b4ea2d0b45c61d31348d8db0d06af8c0fc57ad')

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
