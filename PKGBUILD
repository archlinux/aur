# Maintainer: Xavier Laviron <xavier at norival dot dev>
# Contributor: Tomasz Gąsior <tomaszgasior.pl>

pkgname=symfony-console-autocomplete
pkgver=1.4.1
pkgrel=1
pkgdesc='Bash autocompletion for Symfony Console based scripts.'
arch=('any')
url='https://github.com/bamarni/symfony-console-autocomplete'
license=('MIT')
install=warning.install
depends=('php' 'bash' 'bash-completion')
makedepends=('composer')
source=("https://github.com/bamarni/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=("518c0cd4558ecda88b64af1fd26593ac70fed83f56932f0fafc427294cad0585")

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
