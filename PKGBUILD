# Maintainer: Elias Elwyn <a@jthv.ai>

pkgname=helm-ls-bin
_binname=helm_ls
pkgver=0.1.0
pkgrel=1
pkgdesc='Language server for Helm'
license=(MIT)

url="https://github.com/mrjosh/helm-ls"
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/mrjosh/helm-ls/v$pkgver/LICENSE")
source_x86_64=("$_binname-$pkgver::$url/releases/download/v$pkgver/helm_ls_linux_amd64")
sha256sums=('69fcf81ef258076793149979fba61e50f6fc64273c8192472ba7ab18f1616d71')
sha256sums_x86_64=('f52a23175bde03d467e44a3d8b87793ae4daec526db8b5c1ab1832eed81a584b')

arch=(x86_64)
depends=(glibc)
conflicts=(helm-ls)
provides=(helm-ls)
options=('!strip' '!debug')

package() {
  cd "$srcdir"
  install -Dm755 $_binname-$pkgver "$pkgdir/usr/bin/$_binname"
  install -Dm644 LICENSE-$pkgver -t "$pkgdir/usr/share/licenses/$pkgname"
}
