# Maintainer: mfw <espadonne@outlook.com>

pkgname=gitswitcher
pkgver=1.0.2
pkgrel=1
pkgdesc='Secure Git identity and SSH/GPG key management tool for seamless account switching'
arch=('x86_64')
url='https://github.com/tenseleyFlow/gitswitchC'
license=('GPL-3.0-or-later')
depends=('git' 'openssh' 'openssl')
makedepends=('gcc' 'make')
source=("git+https://github.com/tenseleyFlow/gitswitchC.git#tag=v$pkgver")
md5sums=('SKIP')

build() {
    cd "$srcdir/gitswitchC"
    make BUILD_TYPE=release
}

package() {
    cd "$srcdir/gitswitchC"
    make install DESTDIR="$pkgdir"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}