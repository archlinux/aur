# Maintainer: tee < teeaur at duck dot com >
_pkg=qsv
pkgname=qsv-bin
pkgver=0.130.0
pkgrel=1
pkgdesc='CSVs sliced, diced & analyzed. Quicksilver (qsv) is a fork of the popular xsv utility'
arch=(x86_64)
url='https://github.com/jqnatividad/qsv'
license=('MIT' 'UNLICENSE')
provides=('qsv')
conflicts=('qsv')
source=("$url/raw/$pkgver/LICENSE-MIT" "$url/raw/$pkgver/UNLICENSE"
"$pkgver.bash::$url/raw/$pkgver/contrib/completions/examples/qsv.bash"
"$pkgver.zsh::$url/raw/$pkgver/contrib/completions/examples/qsv.zsh")
source_x86_64=("$url/releases/download/$pkgver/qsv-$pkgver-x86_64-unknown-linux-musl.zip")
sha256sums=('08579b91a9557dcf2ec5085c2f4e01766c489e18f65128f854427796ad31acb4'
            '7e12e5df4bae12cb21581ba157ced20e1986a0508dd10d0e8a4ab9a4cf94e85c'
            '9e0a7941141a9408717253eb44488087b8d89fd16f1acd4a4fd9826717e2e198'
            '8033691ac60af9e12c380530a9b54cbcad4a515a2c215e7a9f0bb016739a8bb7')
sha256sums_x86_64=('bc69b03923bf79f611dffdfa201b02eaa64fa2e6abffd6e0ac48d1cf94712b2d')

package() {
    install -Dm0755 "$_pkg" "$pkgdir/usr/bin/$_pkg"
	install -Dm644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/${pkgname}/"
	install -Dm644 "UNLICENSE" -t "$pkgdir/usr/share/licenses/${pkgname}/"
	install -Dm644 "$pkgver.bash" "$pkgdir/usr/share/bash-completion/completions/$_pkg"
	install -Dm644 "$pkgver.zsh" "$pkgdir/usr/share/zsh/site-functions/$_pkg"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
