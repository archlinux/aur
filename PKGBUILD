pkgname=zep-bin
pkgver=1.0.2
pkgrel=5
pkgdesc="Fast package manager for Zig (binary release)"
arch=('x86_64')
url="https://github.com/XerWoho/zeP"
license=('GPLv3')
provides=('zep')
conflicts=('zep')
source=("https://zep.run/releases/${pkgver}/zep_x86_64-linux_${pkgver}.tar.xz")
sha256sums=('078a36b01ad49297439094bb45aacec240e79db3f7629085e1d523134da800c9')

package() {
    install -Dm755 "$srcdir/zep" "$pkgdir/usr/bin/zep"
}

post_install() {
    echo "--- ZEP CONFIG REQUIRED ---"
    echo " ==> Run '/usr/bin/zep setup' to configure zep"
    echo " ==> Then run: /usr/bin/zep zep install ${pkgver}"
}
