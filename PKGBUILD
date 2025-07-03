pkgbase=windutils
pkgname=('iwdtui' 'syssertui' 'windutils-meta')
pkgver=1.0
pkgrel=1
arch=('any')
license=('MIT')
source=('iwdtui.sh' 'syssertui.sh')
md5sums=('SKIP' 'SKIP')  # or use actual checksums

package_iwdtui() {
    pkgdesc="A TUI made with gum for iwd."
    depends=('gum' 'iwd')
    groups=('windutils')
    install -Dm755 "$srcdir/iwdtui.sh" "$pkgdir/usr/bin/iwdtui"
    #install -Dm664 "$srcdir/iwdtui.1" "$pkgdir/usr/share/man/man1/iwdtui.1"
}
package_syssertui() {
    pkgdesc="A TUI made with gum for systemctl basic functions."
    depends=('gum')
    groups=('windutils')
    install -Dm755 "$srcdir/syssertui.sh" "$pkgdir/usr/bin/syssertui"
    #install -Dm664 "$srcdir/syssertui.1" "$pkgdir/usr/share/man/man1/syssertui.1"
}
package_windutils-meta() {
    pkgdesc="A collection of TUIs made with gum for popular CLIs."
    depends=('gum' 'iwdtui' 'syssertui')
    groups=('windutils')
    provides=('windutils')
    install -d "$pkgdir"
    # install -Dm755 "$srcdir/syssertui.sh" "$pkgdir/usr/bin/syssertui"
    # install -Dm755 "$srcdir/iwdtui.sh" "$pkgdir/usr/bin/iwdtui"
    #install -Dm664 "$srcdir/syssertui.1" "$pkgdir/usr/share/man/man1/syssertui.1"
}
