# Maintainer: AlphaJack <alphajack at tuta dot io>

# set _pkgver to the last version:

#curl -s "https://public.cdn.getdbt.com/fs/latest.json" | jq -r ".tag"

pkgname="dbt-fusion-bin"
_pkgver=2.0.11
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
b2sums_x86_64=('f175f15e953147870c0260d4e64ecbf2c1f872a767cb54f6bd3ce8ea593e0bbb1fd678064a2a13885675ce7b695449345196fadd6c41a215a76645b99d5e2b90')
b2sums_aarch64=('3c418b116236cb63cb14bc619dfa29edb2c94eacb8147edd28717a5f468c05d768da4229d91c06647bf4817ab07bb4f9ce1834642cb7868964b31fd2d42165d4')

package() {
 install -v -D -m 755 "dbt" "$pkgdir/usr/bin/dbtf"
 install -D -m 644 "LICENSES.md" -t "$pkgdir/usr/share/licenses/dbt-fusion"
}
