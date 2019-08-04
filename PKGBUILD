# Maintainer: Tomasz Gąsior <tomaszgasior.pl>

pkgname=symfony-console-autocomplete
pkgver=1.3.5
pkgrel=1
pkgdesc='Bash autocompletion for Symfony Console based scripts.'
arch=('any')
url='https://github.com/bamarni/symfony-console-autocomplete'
license=('MIT')
install=warning.install
depends=('php' 'bash' 'bash-completion')
makedepends=('composer')
source=("https://github.com/bamarni/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=("82907e3a94aaae7284f44c0554b9a85320f6738233e2b3609a11c3a62e53a106")

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
