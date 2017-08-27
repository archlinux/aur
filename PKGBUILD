
# Maintainer: Jan Frederick Eick <jan-frederick.eick@uni-weimar.de>
pkgname=beefi
pkgver=0.2
pkgrel=1
pkgdesc="a bootable EFISTUB kernel image creator (for UEFI systems)"
arch=(any)
url="https://github.com/jfeick/beefi.git"
license=('GPL')
groups=()
depends=("binutils")
makedepends=() 
provides=("${pkgname%}")
conflicts=("${pkgname%}")
replaces=()
backup=('etc/beefi/beefi.conf' 'etc/pacman.d/hooks/beefi.hook')
options=()
install=beefi.install
source=("https://github.com/jfeick/beefi/archive/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('9d421754a4bba5f504d0de7e870e48f2')


prepare() {
	cd "$srcdir/${pkgname%}-${pkgname%}-${pkgver%}"
}


package() {
	cd "$srcdir/${pkgname%}-${pkgname%}-${pkgver%}"
    install -D -g 0 -o 0 -m 755 beefi "${pkgdir}/usr/bin/beefi"
    install -D -g 0 -o 0 -m 0644 beefi.1 "${pkgdir}/usr/share/man/man1/beefi.1"
    gzip "${pkgdir}/usr/share/man/man1/beefi.1"
    install -D -g 0 -o 0 -m 0644 beefi.conf "${pkgdir}/etc/beefi/beefi.conf"
    install -D -g 0 -o 0 -m 0644 beefi.hook "${pkgdir}/etc/pacman.d/hooks/beefi.hook"
}

