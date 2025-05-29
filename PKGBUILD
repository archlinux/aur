# Maintainer: AlphaJack <alphajack at tuta dot io>

# set _pkgver to the last version:

#curl -s "https://public.cdn.getdbt.com/fs/latest.json" | jq -r ".tag"

pkgname="dbt-fusion-bin"
_pkgver=2.0.0-beta.12
pkgver="${_pkgver/-/.}"
pkgrel=1
pkgdesc="The next-generation engine for dbt"
url="https://www.getdbt.com/product/fusion"
license=("custom")
arch=("x86_64" "aarch64")
source=("https://raw.githubusercontent.com/dbt-labs/dbt-fusion/refs/heads/main/LICENSES.md")
source_x86_64=("https://public.cdn.getdbt.com/fs/cli/fs-v$_pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://public.cdn.getdbt.com/fs/cli/fs-v$_pkgver-aarch64-unknown-linux-gnu.tar.gz")
b2sums=('716ed04e146966d2807091968e14b3f6d34f23a748f5f2fb52ee408aeea93ed7c3a08354f0712dcbf552ce70ed943701981457ca16ffe8dbe20530de7ec8fac6')
b2sums_x86_64=('82a5adc5a865b06e21aba949e0afc40774885dd83418192f85fd627fb071cf90656dd07421e2b617933a10193f105c27a6303453b9e0de0d91b04a2c0fa83f61')
b2sums_aarch64=('74ff625ef0803819df1de0b38a61f73ad6f9187dffd9a42a2f612fc9bf9c097b3852bab2202a9459b9b2a993baa5613cd83a8b62ad19dccda683e8f4d3913a8d')

package() {
 install -v -D -m 755 "dbt" "$pkgdir/usr/bin/dbtf"
 install -D -m 644 "LICENSES.md" -t "$pkgdir/usr/share/licenses/dbt-fusion"
}
