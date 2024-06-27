# Maintainer: tarball <bootctl@gmail.com>

pkgname=noseyparker-bin
pkgver=0.17.0
pkgrel=1
pkgdesc='find secrets and sensitive information in textual data and Git history'
url='https://github.com/praetorian-inc/noseyparker'
arch=(x86_64)
license=(Apache-2.0)
provides=(noseyparker)
conflicts=(noseyparker)
depends=(glibc gcc-libs)
noextract=("$pkgname-$pkgver")

source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/noseyparker-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('a9a4aaeea8fd09f652d6d4452f77895b9e5be45726a0bc1fbbc7f1b17b3321da')

package() {
  install -Dm755 bin/noseyparker \
    "$pkgdir/usr/bin/noseyparker"

  install -Dm644 README.md \
    "$pkgdir/usr/share/doc/noseyparker/README.md"

  install -Dm644 share/completions/noseyparker.bash \
    "$pkgdir/usr/share/bash-completion/completions/noseyparker"

  install -Dm644 share/completions/noseyparker.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/noseyparker.fish"

  install -Dm644 share/completions/noseyparker.zsh \
    "$pkgdir/usr/share/zsh/site-functions/_noseyparker"

  install -dm755 "$pkgdir/usr/share/man/"
  cp --archive share/man/. "$pkgdir/usr/share/man/"
}
