# Maintainer: tee < teeaur at duck dot com >
_pkg=qsv
pkgname=qsv-bin
pkgver=3.0.0
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
sha256sums=('08579b91a9557dcf2ec5085c2f4e01766c489e18f65128f854427796ad31acb4'
            '7e12e5df4bae12cb21581ba157ced20e1986a0508dd10d0e8a4ab9a4cf94e85c'
            '0823ab81d921f08b4eb8a84b57d327bc5bf7e331459d13388ec1d9276c45e9b2'
            '1019a80b950804b1b5d4d2aa5946e1442d26ba12d66c252afb86e5b140709a73'
            '1c9497076b0047fa7e81dbf84b2fd45d50485d5a7d740ea793264e7935d34859'
            '853b7be3f886792fd8e01728850446cd2f6e4e54e3e0b5eff39c1561333426d4')
sha256sums_x86_64=('f513d805c25c1820d7a36c47d49bf183371fd38177874133bd998a3531f93692')

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
