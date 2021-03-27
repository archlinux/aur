pkgname=regexops-git
pkgver=1.1
pkgrel=1

pkgdesc='a small tool for printing lines that match Regex patterns'
url='https://github.com/siruidops/regexops'
arch=('x86_64')
license=('BSD')
depends=()
makedepends=('git' 'gcc' 'make' 'glibc')

source=(${pkgname}::git+${url})
sha512sums=('SKIP')

build() {
  cd ${pkgname}
  make
}

package() {
	install -D -t "$pkgdir/usr/bin" "$pkgname/regexops"
	install -Dm644 -t "$pkgdir/usr/share/man/man1" "$pkgname/man/regexops.1.gz"
}
