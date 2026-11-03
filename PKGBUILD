# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="dbt-core-bin"
_pkgname="${pkgname%-bin}"
pkgver=2.0.11
pkgrel=1
pkgdesc="Tool for data analysts to build analytics the way engineers build applications (Rust engine, prebuilt)"
arch=("x86_64" "aarch64")
url="https://www.getdbt.com/"
license=("Apache-2.0")
depends=("gcc-libs" "glibc")
provides=("$_pkgname")
conflicts=("$_pkgname")
options=("!strip")
source=("$_pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/dbt-labs/$_pkgname/v$pkgver/LICENSE")
source_x86_64=("https://github.com/dbt-labs/$_pkgname/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/dbt-labs/$_pkgname/releases/download/v$pkgver/$_pkgname-$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('aaec0fc491a8093b76b7301f6168b9ac05b0fd20e8ea717f7d90691b3b7d8772')
sha256sums_x86_64=('bf468f6f43f6d64eb636c2dd9deb7d1eb17f7c57a09d509c0836b44c60688b4c')
sha256sums_aarch64=('68192de14b71e490209104ab7b3ee022be35db0b2b9f4870e50dcd142fe52d9f')

package(){
 install -D -m 755 "$_pkgname-$pkgver-$CARCH-unknown-linux-gnu/dbt" -t "$pkgdir/usr/bin"
 install -D -m 644 "$_pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
