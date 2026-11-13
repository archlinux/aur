# Maintainer: AlphaJack <alphajack at tuta dot io>

# set _pkgver to the last version:

#curl -s "https://public.cdn.getdbt.com/fs/latest.json" | jq -r ".tag"

pkgname="dbt-fusion-bin"
_pkgver=2.0.12
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
b2sums_x86_64=('6143b49f39059fcfd8b42e301982c8ff9b9db5b1bbcabff9adcb9b7f4e6b67d10d4af81036a365c735c351ea6ceca75a6872231c293abcecd2882eade4664d6b')
b2sums_aarch64=('b16bdffa81f514399bd243d90ac8b612a37e77d6fb21ebb859a4881e49a16b9ee4bcbeb2d2bbaddbde1e649daa04c99f43d5ea6b0d03dd10e163e4d39502996d')

package() {
 install -v -D -m 755 "dbt" "$pkgdir/usr/bin/dbtf"
 install -D -m 644 "LICENSES.md" -t "$pkgdir/usr/share/licenses/dbt-fusion"
}
