# Maintainer: Elias Elwyn <a@jthv.ai>

pkgname=helm-ls-bin
pkgver=0.0.18
pkgrel=1
pkgdesc='Language server for Helm'
arch=(x86_64)
url="https://github.com/mrjosh/helm-ls"
license=(MIT)
_binname=helm_ls
conflicts=(helm-ls)
provides=(helm-ls)
source_x86_64=("$_binname-$pkgver::$url/releases/download/v$pkgver/helm_ls_linux_amd64")
source=("https://raw.githubusercontent.com/mrjosh/helm-ls/v$pkgver/LICENSE")
sha256sums=('69fcf81ef258076793149979fba61e50f6fc64273c8192472ba7ab18f1616d71')
sha256sums_x86_64=('c989446fd7947990cab36fe2ac14b3bdd7d455616abe2a033f1d4e0b3eb619ba')
options=('!strip')

package() {
  cd "$srcdir"
  install -Dm755 $_binname-$pkgver "$pkgdir/usr/bin/$_binname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
