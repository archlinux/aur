# Maintainer: tee < teeaur at duck dot com >
_pkg=qsv
pkgname=qsv-bin
pkgver=0.138.0
pkgrel=1
pkgdesc='CSVs sliced, diced & analyzed. Quicksilver (qsv) is a fork of the popular xsv utility'
arch=(x86_64)
url='https://github.com/jqnatividad/qsv'
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
sha256sums=('08579b91a9557dcf2ec5085c2f4e01766c489e18f65128f854427796ad31acb4'
            '7e12e5df4bae12cb21581ba157ced20e1986a0508dd10d0e8a4ab9a4cf94e85c'
            'fef16b39d7a4b133b31f7e21df37a44f861ef6268c1900d16485d7d71c28bde1'
            '723e20a4959570223ab19927f65188de028071da68850524f551a78fe15c5385'
            '767a66bd6de44544bff2fa2594b3815c075b47aad685d43cead6664c243fdad0'
            'c9ff550fc3c172fa4ae763d6487c447a711b2e641bbe4d409b33af77d258b4a5')
sha256sums_x86_64=('a0c427b712419711de769521fa02bf66b73c267fc6e4922d69353bf50f81db19')

package() {
    install -Dm0755 "qsv" -t "$pkgdir/usr/bin/"
    install -Dm0755 "qsvdp" -t "$pkgdir/usr/bin/"
	install -Dm644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/${pkgname}/"
	install -Dm644 "UNLICENSE" -t "$pkgdir/usr/share/licenses/${pkgname}/"
	install -Dm644 "$pkgver.bash" "$pkgdir/usr/share/bash-completion/completions/$_pkg"
	install -Dm644 "$pkgver.zsh" "$pkgdir/usr/share/zsh/site-functions/_$_pkg"
	install -Dm644 "$pkgver.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$_pkg.fish"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
