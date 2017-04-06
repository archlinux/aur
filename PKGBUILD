# Maintainer: Damien Robert <damien.olivier.robert+aur@gmail.com>

pkgname=modtree
pkgver=1
pkgrel=1
pkgdesc="Tree based kernel module dependency viewer"
arch=('i686' 'x86_64')
url="https://github.com/falconindy/modtree"
license=('MIT')
groups=('base-devel')
depends=()
source=("https://github.com/falconindy/modtree/archive/v1.tar.gz")

md5sums=('c10ef8b73495b21bbd365aa2152738a9')

build() {
        cd "$srcdir/$pkgname-$pkgver"
        ./autogen.sh
        ./configure --prefix=/usr
        make
}

package() {
        cd "$srcdir/$pkgname-$pkgver"
        make DESTDIR="$pkgdir/" install
}
