# Maintainer: Vyacheslav Darnitsyn <evatisystem@gmail.com>
pkgname='chronograph-git'
pkgver=1.0.0
pkgrel=1
pkgdesc="Chronograph is a modern and elegant interactive calendar."
arch=('x86_64')
url="https://github.com/VyacheslavErl/chronograph"
license=('GPL')
depends=('python' 'python-pyqt6')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/VyacheslavErl/chronograph/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
    :
}

build() {
    :
}

package() {
    cd "$srcdir/chronograph-${pkgver}"
    make DESTDIR="$pkgdir/" install
    install -Dm755 /dev/null "$pkgdir/usr/bin/chronograph-launcher"
    echo '#!/usr/bin/env python' > "$pkgdir/usr/bin/chronograph-launcher"
    echo 'import sys' >> "$pkgdir/usr/bin/chronograph-launcher"
    echo 'sys.path.insert(0, "/usr/share/chronograph")' >> "$pkgdir/usr/bin/chronograph-launcher"
    echo 'from main import main' >> "$pkgdir/usr/bin/chronograph-launcher"
    echo 'main()' >> "$pkgdir/usr/bin/chronograph-launcher"
    chmod +x "$pkgdir/usr/bin/chronograph-launcher"
}

