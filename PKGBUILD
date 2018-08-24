# Maintainer: Zhanibek Adilbekov <zhnaibek.adilbekov@pm.me>
# Original Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=gibo
pkgver=2.1.0
pkgrel=1
pkgdesc="A shell script for easily accessing gitignore boilerplates"
url="https://github.com/simonwhitaker/gibo"
arch=('any')
install="$pkgname.install"
license=('custom:UNLICENSE')
source=("https://github.com/simonwhitaker/$pkgname/archive/$pkgver.tar.gz"
        "$pkgname.install")
md5sums=('e60be99fafc2d1f27152062e4e776ac3'
		'b1b49419e90f7b7f0e84a214ecfdbfef')

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname

	# license
	install -Dm644 UNLICENSE $pkgdir/usr/share/licenses/$pkgname/UNLICENSE

	# bash
	mkdir -p $pkgdir/usr/share/bash-completion
	install -Dm644 ./shell-completions/$pkgname-completion.bash $pkgdir/usr/share/bash-completion/completions/$pkgname

	# zsh
	mkdir -p $pkgdir/usr/share/zsh/site-functions
	install -Dm644 ./shell-completions/$pkgname-completion.zsh $pkgdir/usr/share/zsh/site-functions/_$pkgname

	# fish
	mkdir -p $pkgdir/usr/share/fish/completions
	install -Dm644 ./shell-completions/$pkgname.fish $pkgdir/usr/share/fish/completions/$pkgname.fish
}

