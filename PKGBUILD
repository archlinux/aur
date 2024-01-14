# Maintainer: aksr <aksr at t-com dot me>
pkgname=neatas-git
pkgver=r25.269256f
pkgrel=2
pkgdesc='A simple ARM assembler.'
arch=('i686' 'x86_64')
url='http://repo.or.cz/neatas.git'
license=('custom:BSD')
makedepends=('git')
optdepends=('neatcc-git: A simple ARM/x86(_64) C compiler'
            'neatld-git: A simple ARM/x86(_64) static linker'
            'neatlibc-git: A small ARM/x86(_64) libc')
source=("$pkgname::git+git://repo.or.cz/neatas.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m755 neatas "$pkgdir/usr/bin/neatas"
}
