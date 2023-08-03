# Maintainer: Pig Fang <g-plane@hotmail.com>
# Contributor: 欠陥電気 <misaka13514@gmail.com>

pkgname=pnpm-shell-completion
pkgver=0.5.2
pkgrel=1
pkgdesc='Complete your pnpm command fastly.'
arch=('x86_64')
url='https://github.com/g-plane/pnpm-shell-completion'
license=('MIT')
depends=('glibc' 'gcc-libs')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/pnpm-shell-completion_$arch-unknown-linux-gnu.tar.gz")
sha256sums=('072055533171dd1bf8fee3396a5fd62aef5927ff522feb378cfa013bbfb465f1')

package() {
  install -Dm755 -t $pkgdir/usr/bin pnpm-shell-completion
  install -Dm644 pnpm-shell-completion.plugin.zsh $pkgdir/usr/share/zsh/plugins/pnpm-shell-completion/pnpm-shell-completion.zsh
  install -Dm644 -t $pkgdir/usr/share/fish/vendor_completions.d pnpm-shell-completion.fish
  install -Dm644 -t $pkgdir/usr/share/licenses/$pkgname LICENSE
}
