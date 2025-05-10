# Maintainer: tarball <bootctl@gmail.com>
#
# Upstream takes a few days to provide binary packages after a release is cut.

pkgname=noseyparker-bin
pkgver=0.24.0
pkgrel=1
pkgdesc='find secrets and sensitive information in textual data and Git history'
url='https://github.com/praetorian-inc/noseyparker'
arch=(x86_64 aarch64)
license=(Apache-2.0)
provides=(noseyparker)
conflicts=(noseyparker)
depends=(glibc gcc-libs)

source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/noseyparker-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/noseyparker-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('1bd04ea06ce886a7cd1995a814c5570be01b019adacf27fd158cbdfb01da1f3c')
sha256sums_aarch64=('9b7e0294c7a0a49942b459bcfa46d57e7f4a01a675e20c51ab8069ef30088edf')

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
