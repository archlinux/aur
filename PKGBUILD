# Maintainer: tee < teeaur at duck dot com >
_pkg=qsv
pkgname=qsv-bin
pkgver=2.1.0
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
            'e6861a2a39aa6e7309e57e6598ed2ab1fa1e724d8152f97c42700001e3c018bc'
            'bfcc6b71278b6d2c8f5e540eb46d3a82386c74e3302b0df78b90b6a0a368119e'
            'c880ed193af565fcf044a33f45ae1c1e92f9f2c2ad2409a00389e30dbcae1043'
            'eda5c6f4bb4a5b417460caa0eddc28db37e37f233f860741df12db7a2dd3fb3a')
sha256sums_x86_64=('10231a522f250a0badbdaef9b2a5bd381357bc733df32a31c0a958612b7a2c0b')

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
