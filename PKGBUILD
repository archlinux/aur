# Maintainer: tee < teeaur at duck dot com >
_pkg=qsv
pkgname=qsv-bin
pkgver=5.1.0
pkgrel=1
pkgdesc='CSVs sliced, diced & analyzed. Quicksilver (qsv) is a fork of the popular xsv utility'
arch=(x86_64)
url='https://github.com/dathere/qsv'
license=('MIT' 'UNLICENSE')
provides=('qsv')
conflicts=('qsv')
depends=('python>=3.13')
source=("$url/raw/$pkgver/LICENSE-MIT" "$url/raw/$pkgver/UNLICENSE"
"$pkgver.bash::$url/raw/$pkgver/contrib/completions/examples/qsv.bash"
"$pkgver.elv::$url/raw/$pkgver/contrib/completions/examples/qsv.elv"
"$pkgver.fish::$url/raw/$pkgver/contrib/completions/examples/qsv.fish"
"$pkgver.zsh::$url/raw/$pkgver/contrib/completions/examples/qsv.zsh")
source_x86_64=("$url/releases/download/$pkgver/qsv-$pkgver-$arch-unknown-linux-gnu.zip")
sha256sums=('SKIP'
            'SKIP'
            'f06abd0a84d1eab426e1e8d7ae5e0d7c6156775012f86a4ab30c979ee5358a5e'
            'f51d094d17a523002f3f9cc56a2e843d818824eac948e12a4590af1763f1dc23'
            'a413c6011dfa7011b23587518c8fa1109e2c71ffcbc9ff8d1043aa3e4daa1942'
            'fada7d74e8c795e47e4d8c8d0db98d25a3cca21b65965b5951d521825c470670')
sha256sums_x86_64=('80a4bf70a93208556ff1e64d71aeb8316d08bce14d741eee7a25a1996e98835f')

package() {
    install -Dm755 "qsvpy313" "$pkgdir/usr/bin/qsv"
    install -Dm755 "qsvdp" -t "$pkgdir/usr/bin/"
	install -Dm644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/${pkgname}/"
	install -Dm644 "UNLICENSE" -t "$pkgdir/usr/share/licenses/${pkgname}/"
	install -Dm644 "$pkgver.bash" "$pkgdir/usr/share/bash-completion/completions/$_pkg"
	install -Dm644 "$pkgver.elv" "$pkgdir/usr/share/elvish/lib/$_pkg.elv"
	install -Dm644 "$pkgver.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$_pkg.fish"
	install -Dm644 "$pkgver.zsh" "$pkgdir/usr/share/zsh/site-functions/_$_pkg"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
