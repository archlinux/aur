# Maintainer: MGislv <nocentinigabriele91@gmail.com>
# Contributor: Clint Valentine <valentine.clint@gmail.com>

pkgname=hosts
pkgver=3.6.4
pkgrel=1
pkgdesc="A command line tool for managing hosts file entries."
arch=('any')
url="https://github.com/xwmx/hosts"
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://github.com/xwmx/$pkgname/archive/$pkgver.tar.gz)
sha512sums=('99b6da57de13574a5af479f89686169f3081b802b17a46a8fe0e6c5d3e4b939f195006085ab7fb19cd66ffea5cb78b248a929c251bc38221964f4a2c73e2bd1e')

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir"/usr/bin
	PREFIX="$pkgdir"/usr make install

	install -Dm644 etc/hosts-completion.zsh "$pkgdir"/usr/share/zsh/site-functions/_hosts
	install -Dm644 etc/hosts-completion.bash "$pkgdir"/usr/share/bash-completion/completions/hosts
	install -Dm644 README.md "$pkgdir"/usr/share/doc/"$pkgname"/README.md
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
