# Maintainer: tee < teeaur at duck dot com >
_pkg=qsv
pkgname=qsv-bin
pkgver=8.1.1
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
            '233c90818eee08eae874ceea1610cf6d9afe3c0c9c7568ce23a838aea831c2d1'
            '215a1bd3fd3d1bca8acdc6d9e9a0ac68d32093153847c7d486d06d8910e8daf7'
            '360b157e3b3fc9b27156c69bc2885bd52c4d21539213cd72052fd5254eec8761'
            '3e9655bdf946b412518fcfe6b628ab2a0c041c918b7302405ceb08a02779425c')
sha256sums_x86_64=('3d532e9af2ef9a7b274b8ee3f84eaa2b32732511ea6b8354747b1934605473fd')

package() {
	install -Dm755 qsvpy313 "$pkgdir/usr/bin/qsv"
	install -Dm755 qsvpdp -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/${pkgname}/"
	install -Dm644 UNLICENSE -t "$pkgdir/usr/share/licenses/${pkgname}/"
	install -Dm644 "$pkgver.bash" "$pkgdir/usr/share/bash-completion/completions/$_pkg"
	install -Dm644 "$pkgver.elv" "$pkgdir/usr/share/elvish/lib/$_pkg.elv"
	install -Dm644 "$pkgver.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$_pkg.fish"
	install -Dm644 "$pkgver.zsh" "$pkgdir/usr/share/zsh/site-functions/_$_pkg"
}
# vim:set noet sts=0 sw=4 ts=4:
