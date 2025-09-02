# Maintainer: Ivan Vasilev 20002mc@gmail.com
pkgname=cdf
pkgver=0.1.1 
pkgrel=1 
pkgdesc="CLI tool to manage path bookmarks in the terminal" 
arch=('x86_64' 'armv7h' 'aarch64') 
url="https://github.com/cl1ckname/cdf" 
license=('MIT') # Confirm the license in your repository and update if necessary 
makedepends=('go') 
install=cdf.install
source=("$url/archive/v$pkgver.tar.gz") 
sha256sums=('1079e4e8786931b96706b87e40749e8aab8964b605adce9a15e0b131d86d9b94') # Run updpkgsums to generate the correct checksum

build() { 
	cd "$srcdir/$pkgname-$pkgver" 
	go build -o $pkgname 
}

package() { 
	cd "$srcdir/$pkgname-$pkgver" 
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname" 
}
