# Maintainer: Pig Fang <g-plane@hotmail.com>
# Contributor: 欠陥電気 <misaka13514@gmail.com>

pkgname=pnpm-shell-completion-bin
_pkgname=pnpm-shell-completion
pkgver=0.5.5
pkgrel=1
pkgdesc='Complete your pnpm command fastly.'
arch=('x86_64')
url='https://github.com/g-plane/pnpm-shell-completion'
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=('pnpm-shell-completion')
conflicts=('pnpm-shell-completion')
replaces=('pnpm-shell-completion')
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/pnpm-shell-completion_$arch-unknown-linux-gnu.tar.gz")
sha256sums=('eae0a5ab8dc26e296a9735753cfb569e7e2bcd9f29a686294ac6f68871b0e712')

package() {
  install -Dm755 -t $pkgdir/usr/bin pnpm-shell-completion
  install -Dm644 pnpm-shell-completion.plugin.zsh $pkgdir/usr/share/zsh/plugins/pnpm-shell-completion/pnpm-shell-completion.zsh
  install -Dm644 -t $pkgdir/usr/share/fish/vendor_completions.d pnpm.fish
  install -Dm644 -t $pkgdir/usr/share/licenses/$_pkgname LICENSE
}
