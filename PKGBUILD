# Maintainer: Evan Purkhiser <evanpurkhiser@gmail.com>

_pkgname=mkinitcpio-colors
pkgname=${_pkgname}-git
pkgdesc="mkinitcpio hook to set VT console colors during early userspace"
license=('MIT')
url="https://github.com/EvanPurkhiser/${_pkgname}"
pkgver=9.5264b13
pkgrel=1

source=("$pkgname::git://github.com/EvanPurkhiser/${_pkgname}")
md5sums=('SKIP')
install="usage.install"
depends=('mkinitcpio' 'setcolors-git')
makedepends=('git')
arch=('any')

pkgver() {
    cd "$srcdir/$pkgname"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    cd "$srcdir/$pkgname"

    install -Dm 644 hooks/colors "${pkgdir}/usr/lib/initcpio/hooks/colors"
    install -Dm 644 install/colors "${pkgdir}/usr/lib/initcpio/install/colors"

    install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
