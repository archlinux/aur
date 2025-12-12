pkgname=zep-bin
pkgver=0.7
pkgrel=2
pkgdesc="Fast package manager for Zig (binary release)"
arch=('x86_64')
url="https://github.com/XerWoho/zeP"
license=('GPLv3')
provides=('zep')
conflicts=('zep')
source=("https://zep.run/releases/${pkgver}-dev-1/zep_x86_64-linux_${pkgver}-dev-1.tar.xz")
sha256sums=('f21602c9f57eb1506580446b3c80e129faf4802cd3c7107f6596b0e3b2859c43')

package() {
    install -Dm755 "$srcdir/zep" "$pkgdir/usr/bin/zep"
}

post_install() {
    echo "--- ZEP CONFIG REQUIRED ---"
    echo " ==> Run 'zep setup' to configure zeP"
    echo " ==> Then run: zep zep install 0.7-dev-1"
}
