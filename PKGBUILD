pkgname=zep-bin
pkgver=0.9.0
pkgrel=2
pkgdesc="Fast package manager for Zig (binary release)"
arch=('x86_64')
url="https://github.com/XerWoho/zeP"
license=('GPLv3')
provides=('zep')
conflicts=('zep')
source=("https://zep.run/releases/${pkgver}/zep_x86_64-linux_${pkgver}.tar.xz")
sha256sums=('37d09229bcec6efaa3b66d0143b27d305040b34ecbc51089169fe0db6919d676')

package() {
    install -Dm755 "$srcdir/zep" "$pkgdir/usr/bin/zep"
}

post_install() {
    echo "--- ZEP CONFIG REQUIRED ---"
    echo " ==> Run '/usr/bin/zep setup' to configure zep"
    echo " ==> Then run: /usr/bin/zep zep install ${pkgver}"
}
