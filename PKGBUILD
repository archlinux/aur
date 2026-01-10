pkgname=zep-bin
pkgver=1.0.1
pkgrel=4
pkgdesc="Fast package manager for Zig (binary release)"
arch=('x86_64')
url="https://github.com/XerWoho/zeP"
license=('GPLv3')
provides=('zep')
conflicts=('zep')
source=("https://zep.run/releases/${pkgver}/zep_x86_64-linux_${pkgver}.tar.xz")
sha256sums=('1d4f37dd54a8f6b2b11bf038e793ed335152b65b8362426352ff7cc14271262f')

package() {
    install -Dm755 "$srcdir/zep" "$pkgdir/usr/bin/zep"
}

post_install() {
    echo "--- ZEP CONFIG REQUIRED ---"
    echo " ==> Run '/usr/bin/zep setup' to configure zep"
    echo " ==> Then run: /usr/bin/zep zep install ${pkgver}"
}
