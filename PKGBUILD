# Maintainer: Viktor Stanchev <me aatt viktorstanchev doot com>

_pkgname=urxvt-font-size
pkgname=${_pkgname}-git
pkgver=r32.0984499
pkgrel=1
pkgdesc='On-the-fly URxvt font size adjustments'
arch=('any')
url="https://github.com/majutsushi/${_pkgname}"
license=('MIT')
depends=('rxvt-unicode' 'xorg-xrdb' 'xorg-xlsfonts')
makedepends=('git')
provides=('urxvt-font-size')
conflicts=('urxvt-font-size')
install='urxvt-font-size.install'
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/majutsushi/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgname"
    install -D -m755 font-size "$pkgdir/usr/lib/urxvt/perl/font-size"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m644 README.markdown "$pkgdir/usr/share/doc/$pkgname/README.markdown"
}
