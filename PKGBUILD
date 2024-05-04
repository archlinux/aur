# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: Justin Lavoie <just1602@riseup.net>
# Contributor: Viktor Stanchev <me aatt viktorstanchev doot com>

pkgname=urxvt-font-size-git
pkgver=r32.0984499
pkgrel=1
pkgdesc='On-the-fly URxvt font size adjustments'
arch=('any')
url="https://github.com/majutsushi/${pkgname%-git}"
license=('MIT')
depends=('rxvt-unicode'
         'xorg-xrdb'
         'xorg-xlsfonts')
makedepends=('git')
install="${pkgname%-git}.install"
source=("git+https://github.com/majutsushi/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -D -m755 font-size "$pkgdir/usr/lib/urxvt/perl/font-size"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m644 README.markdown "$pkgdir/usr/share/doc/$pkgname/README.markdown"
}
