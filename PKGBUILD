# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=faff
pkgver=0.2.0
pkgrel=1
pkgdesc='ollama powered conventional commit message generator'
arch=(any)
url="https://github.com/wimpysworld/$pkgname"
license=(MIT)
depends=(bash
         bc
         coreutils
         curl
         jq
         git)
optdepends=('ollama: default usage expects models on localhost')
source=("git+$url.git#tag=$pkgver")
sha256sums=('b3762bdba5f6150c57dbbdf9db38028954d803b0c579e36906874d51780afbe2')

package () {
	cd "$pkgname"
	install -Dm0755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
