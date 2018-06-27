# Maintainer: Tomasz Gąsior <tomaszgasior.pl>

pkgname=symfony-console-autocomplete
pkgver=1.3.4
pkgrel=1
pkgdesc='Bash autocompletion for Symfony Console based scripts.'
arch=('any')
url='https://github.com/bamarni/symfony-console-autocomplete'
license=('MIT')
install=warning.install
depends=('php' 'bash' 'bash-completion')
makedepends=('composer')
source=("https://github.com/bamarni/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=("217387d3581660932f7367dd4dce6fcdf2280f1fddd4b953ac1e433100c8b9ff")

prepare()
{
	cd "$srcdir/$pkgname-$pkgver"
	composer install --no-dev
}

package()
{
	cd "$srcdir/$pkgname-$pkgver/bin"
	mkdir -p "$pkgdir/etc/bash_completion.d"
	./symfony-autocomplete > "$pkgdir/etc/bash_completion.d/$pkgname"
}