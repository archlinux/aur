pkgname=zep-bin
pkgver=0.8
pkgrel=1
pkgdesc="Fast package manager for Zig (binary release)"
arch=('x86_64')
url="https://github.com/XerWoho/zeP"
license=('GPLv3')
provides=('zep')
conflicts=('zep')
source=("https://zep.run/releases/${pkgver}/zep_x86_64-linux_${pkgver}.tar.xz")
sha256sums=('61da5e4164913072404c273aae6966cc86f76d830e8f59462973986a6b558945')

package() {
    install -Dm755 "$srcdir/zep" "$pkgdir/usr/bin/zep"
}

post_install() {
    echo "--- ZEP CONFIG REQUIRED ---"
    echo " ==> Run '/usr/bin/zep setup' to configure zep"
    echo " ==> Then run: /usr/bin/zep zep install 0.8"
}
