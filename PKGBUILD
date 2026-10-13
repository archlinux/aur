# Maintainer: MiPnamic <mipnamic at mipnamic dot net>

pkgname=git-side-bin
_pkgname=git-side
pkgver=0.4.2
pkgrel=1
pkgdesc="Git subcommand that versions files that should not live in the main repository (prebuilt binary)"
arch=('x86_64')
url="https://github.com/Solexma/git-side"
license=('MIT')
depends=('glibc' 'libgcc' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!debug' '!strip')
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/Solexma/$_pkgname/v$pkgver/LICENSE")
source_x86_64=("$_pkgname-$pkgver-$CARCH::https://github.com/Solexma/$_pkgname/releases/download/v$pkgver/$_pkgname-linux-amd64")
sha256sums=('3da1bbefd42cf407978d8a7bdfdb9d63ea14298fd2ae6e4ea0f242a802f1cf96')
sha256sums_x86_64=('59576df2b8aaa7709c99b748f92b05da6d9fd40db0ede5fa437815e1e87ebca2')

package() {
  install -Dm755 "$_pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
