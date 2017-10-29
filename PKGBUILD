# Maintainer: Karol Babioch <karol@babioch.de>
# Contributor: nullren
# Contributor: N. Izumi - izmntuk

pkgname=symlinks
pkgver=1.4.3
pkgrel=3
pkgdesc='Scan and change symbolic links'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
depends=('glibc')
makedepends=('git')
conflicts=("$pkgname-git")
url="https://github.com/brandt/symlinks"
source=("git+https://github.com/brandt/symlinks#tag=v$pkgver")
sha256sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
    install -Dm0755 symlinks "$pkgdir/usr/bin/symlinks"
    install -Dm0644 Readme.md "$pkgdir/usr/share/$pkgname/README.md"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 symlinks.8 "$pkgdir/usr/share/man/man8/symlinks.8"
}

