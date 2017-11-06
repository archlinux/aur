# Maintainer: Sarah Kraßnigg <buckling.spring@mailbox.org>
_pkgname=lightdm-tty
pkgname=lightdm-webkit2-theme-tty-git
pkgver=r5.0b8fc23
pkgrel=1
pkgdesc="A simple terminal style theme for lightdm-webkit2-greeter"
arch=('any')
url="https://github.com/eNzyOfficial/lightdm-tty"
license=('WTFPL')
depends=('lightdm-webkit2-greeter')
makedepends=('git')
source=("lightdm-tty::git+https://github.com/eNzyOfficial/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -dm755 "$pkgdir/usr/share/lightdm-webkit/themes/tty"
    cp -r "$srcdir/${_pkgname}/"* "$pkgdir/usr/share/lightdm-webkit/themes/tty/"
}
