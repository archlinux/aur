pkgname=zep-bin
pkgver=1.0.0
pkgrel=3
pkgdesc="Fast package manager for Zig (binary release)"
arch=('x86_64')
url="https://github.com/XerWoho/zeP"
license=('GPLv3')
provides=('zep')
conflicts=('zep')
source=("https://zep.run/releases/${pkgver}/zep_x86_64-linux_${pkgver}.tar.xz")
sha256sums=('e7d716524f3cb59eac7ebbcd5afd09cdeee7493a83849407ee3172dd983721d9')

package() {
    install -Dm755 "$srcdir/zep" "$pkgdir/usr/bin/zep"
}

post_install() {
    echo "--- ZEP CONFIG REQUIRED ---"
    echo " ==> Run '/usr/bin/zep setup' to configure zep"
    echo " ==> Then run: /usr/bin/zep zep install ${pkgver}"
}
