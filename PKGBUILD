# Maintainer: AlphaJack <alphajack at tuta dot io>

# set _pkgver to the last version:

#curl -s "https://public.cdn.getdbt.com/fs/latest.json" | jq -r ".tag"

pkgname="dbt-fusion-bin"
_pkgver=2.0.13
pkgver="${_pkgver/-/.}"
pkgrel=1
pkgdesc="The next-generation engine for dbt"
url="https://www.getdbt.com/product/fusion"
license=("custom")
arch=("x86_64" "aarch64")
source=("https://raw.githubusercontent.com/dbt-labs/dbt-fusion/refs/heads/main/LICENSES.md")
source_x86_64=("https://public.cdn.getdbt.com/fs/cli/fs-v$_pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://public.cdn.getdbt.com/fs/cli/fs-v$_pkgver-aarch64-unknown-linux-gnu.tar.gz")
b2sums=('02b4a21de1049ad3fb76f90c5b8d21b6db163fc5b0beefa770558594a92bb9c1b7aa60039ba675c5e57389d9525814397a6a563c8467fb8973a5d206df7b41c2')
b2sums_x86_64=('ba0842c1b59d15eb6e8336ab8fe922703af23eca66502813dac1912fb8fdb67315d39abbca7fc8e336f72b4302bd8d034af980a1e70c5814954a265805773a41')
b2sums_aarch64=('7eebc2f4057a5506bde26f95ba0f64590491b93be2aaf6840e1f327e59b7fcb6469d85d499fa3582e4a6412fd16c53925cd8512e97b900b30f7ea260f341fccb')

package() {
 install -v -D -m 755 "dbt" "$pkgdir/usr/bin/dbtf"
 install -D -m 644 "LICENSES.md" -t "$pkgdir/usr/share/licenses/dbt-fusion"
}
