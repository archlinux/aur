# Maintainer: tee < teeaur at duck dot com >
_pkg=qsv
pkgname=qsv-bin
pkgver=0.131.0
pkgrel=1
pkgdesc='CSVs sliced, diced & analyzed. Quicksilver (qsv) is a fork of the popular xsv utility'
arch=(x86_64)
url='https://github.com/jqnatividad/qsv'
license=('MIT' 'UNLICENSE')
provides=('qsv')
conflicts=('qsv')
source=("$url/raw/$pkgver/LICENSE-MIT" "$url/raw/$pkgver/UNLICENSE"
"$pkgver.bash::$url/raw/$pkgver/contrib/completions/examples/qsv.bash"
"$pkgver.zsh::$url/raw/$pkgver/contrib/completions/examples/qsv.zsh"
"$pkgver.fish::$url/raw/$pkgver/contrib/completions/examples/qsv.fish")
source_x86_64=("$url/releases/download/$pkgver/qsv-$pkgver-x86_64-unknown-linux-musl.zip")
sha256sums=('08579b91a9557dcf2ec5085c2f4e01766c489e18f65128f854427796ad31acb4'
            '7e12e5df4bae12cb21581ba157ced20e1986a0508dd10d0e8a4ab9a4cf94e85c'
            '6410a8e842ea9413dd0a02db9cb741b08f4e920ceae83872cd61513cce9444a6'
            '59c6259f637c36cce0344e9785b02f0708e6ad9a600d8aca7dfb3501a070045a'
            '6841e77e2fa6fb64aa3f0fa06521feec16d59a60f61ae4fa0d0789ed0c123d37')
sha256sums_x86_64=('778b298b290707449f2b1f8e77184730c15ee2e4a561c3167bff2bf4030fab12')

package() {
    install -Dm0755 "$_pkg" "$pkgdir/usr/bin/$_pkg"
	install -Dm644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/${pkgname}/"
	install -Dm644 "UNLICENSE" -t "$pkgdir/usr/share/licenses/${pkgname}/"
	install -Dm644 "$pkgver.bash" "$pkgdir/usr/share/bash-completion/completions/$_pkg"
	install -Dm644 "$pkgver.zsh" "$pkgdir/usr/share/zsh/site-functions/$_pkg"
	install -Dm644 "$pkgver.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$_pkg.fish"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
