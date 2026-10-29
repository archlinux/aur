# Maintainer: AlphaJack <alphajack at tuta dot io>

# set _pkgver to the last version:

#curl -s "https://public.cdn.getdbt.com/fs/latest.json" | jq -r ".tag"

pkgname="dbt-fusion-bin"
_pkgver=2.0.10
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
b2sums_x86_64=('b50a6ffb5e3c99f556ca1235da0924f79e17bc3cb8ee08773662bc8a4b9bf343933ebcedc3b7c2a880be62523b193962c18fe24523c06198b3b17ed020da939a')
b2sums_aarch64=('57762fed605c07a3dc47c8fbc60fca72941e7452bf3327937113b2651483e6d4560bee44a168db3832af881593ef3e8a0a2ee4d05865ff9b94ce080c77e120c5')

package() {
 install -v -D -m 755 "dbt" "$pkgdir/usr/bin/dbtf"
 install -D -m 644 "LICENSES.md" -t "$pkgdir/usr/share/licenses/dbt-fusion"
}
