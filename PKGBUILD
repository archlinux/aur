# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=gibo
pkgver=1.0.4
pkgrel=1
pkgdesc="A shell script for easily accessing gitignore boilerplates"
url="https://github.com/simonwhitaker/gibo"
arch=('any')
license=('custom:UNLICENSE')
source=("https://github.com/simonwhitaker/$pkgname/archive/$pkgver.tar.gz"
        "$pkgname.install")
md5sums=('a6236266d05c949aafc95663fb0e9d98'
         'b1b49419e90f7b7f0e84a214ecfdbfef')

package() {
	cd "$pkgname-$pkgver"
	
	install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname

	# license
	install -Dm644 UNLICENSE $pkgdir/usr/share/licenses/$pkgname/UNLICENSE

	# bash
	mkdir -p $pkgdir/usr/share/bash-completion
	install -Dm644 ./$pkgname-completion.bash $pkgdir/usr/share/bash-completion/completions/$pkgname
	
	# zsh
	mkdir -p $pkgdir/usr/share/zsh/site-functions	
	install -Dm644 ./$pkgname-completion.bash $pkgdir/usr/share/zsh/site-functions/_$pkgname
}

