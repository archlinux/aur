pkgname=repoconductor-bin
pkgver=1.3.0
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
sha256sums=('cbdd4287ce8542fcb8c7fbcc7bf4197ae9514b889baf410361cf3549551da81e'
            '1d41d31dbea900b5b80f6f29ab74330f8b4d1245029fd6ce9821fb5f708739a0')

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
