# Maintainer: tee < teeaur at duck dot com >
_pkg=qsv
pkgname=qsv-bin
pkgver=4.0.0
pkgrel=1
pkgdesc='CSVs sliced, diced & analyzed. Quicksilver (qsv) is a fork of the popular xsv utility'
arch=(x86_64)
url='https://github.com/dathere/qsv'
license=('MIT' 'UNLICENSE')
provides=('qsv')
conflicts=('qsv')
requires=('python')
source=("$url/raw/$pkgver/LICENSE-MIT" "$url/raw/$pkgver/UNLICENSE"
"$pkgver.bash::$url/raw/$pkgver/contrib/completions/examples/qsv.bash"
"$pkgver.elv::$url/raw/$pkgver/contrib/completions/examples/qsv.elv"
"$pkgver.fish::$url/raw/$pkgver/contrib/completions/examples/qsv.fish"
"$pkgver.zsh::$url/raw/$pkgver/contrib/completions/examples/qsv.zsh")
source_x86_64=("$url/releases/download/$pkgver/qsv-$pkgver-$arch-unknown-linux-gnu.zip")
sha256sums=('SKIP'
            'SKIP'
            '624b1a8f39e9200e2329ba7b84ea1112ab0f9bfd6832a2f04a04fd8b9f1f3455'
            'e568554324cca5c3dffe6fa4430ce6207199f89bab0d2d5cc56cfb482c65ce71'
            'ed6fb9b9a8e8616f693addc5dafa3bcfa47c829e1c7922e9fe28b4671a6bea6f'
            '78bcec993d1202bf927ad9cf7afd499ea62054920aae29bbd3f606af6bdd0e65')
sha256sums_x86_64=('9700a164d276e4a973ad3cbb7ab1dd1dd0b3108c712752cd1fae9eeda5a65fb9')

package() {
    install -Dm0755 "qsvpy313" "$pkgdir/usr/bin/qsv"
    install -Dm0755 "qsvdp" -t "$pkgdir/usr/bin/"
	install -Dm644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/${pkgname}/"
	install -Dm644 "UNLICENSE" -t "$pkgdir/usr/share/licenses/${pkgname}/"
	install -Dm644 "$pkgver.bash" "$pkgdir/usr/share/bash-completion/completions/$_pkg"
	install -Dm644 "$pkgver.zsh" "$pkgdir/usr/share/zsh/site-functions/_$_pkg"
	install -Dm644 "$pkgver.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$_pkg.fish"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
