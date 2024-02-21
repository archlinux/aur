# Maintainer: Pig Fang <g-plane@hotmail.com>
# Contributor: 欠陥電気 <misaka13514@gmail.com>

pkgname=pnpm-shell-completion
pkgver=0.5.3
pkgrel=1
pkgdesc='Complete your pnpm command fastly.'
arch=('x86_64')
url='https://github.com/g-plane/pnpm-shell-completion'
license=('MIT')
depends=('glibc' 'gcc-libs')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/pnpm-shell-completion_$arch-unknown-linux-gnu.tar.gz")
sha256sums=('1cdb8c1babb29d456a3cf038c556a9c5e23612aaadbc027b3507498ca00cae8b')

package() {
  install -Dm755 -t $pkgdir/usr/bin pnpm-shell-completion
  install -Dm644 pnpm-shell-completion.plugin.zsh $pkgdir/usr/share/zsh/plugins/pnpm-shell-completion/pnpm-shell-completion.zsh
  install -Dm644 -t $pkgdir/usr/share/fish/vendor_completions.d pnpm.fish
  install -Dm644 -t $pkgdir/usr/share/licenses/$pkgname LICENSE
}
