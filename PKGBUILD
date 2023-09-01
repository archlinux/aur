# Maintainer: raf <raf at raf got org>
pkgname=danectl
pkgver=0.8.4
pkgrel=1
pkgdesc="DNSSEC DANE implementation manager"
arch=("any")
url=https://raf.org/danectl/
license=("GPL")
depends=(coreutils sed grep ldns certbot openssl perl openssh gnupg libidn2)
source=("https://github.com/raforg/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=("179730da7e8d7b68f62b92292b7bc883922fa5cb8361eba22666a1fa6886e10e")

check()
{
	cd "$pkgname-$pkgver"
	make test
}

package()
{
	cd "$pkgname-$pkgver"
	make PREFIX="$pkgdir"/usr install
}

