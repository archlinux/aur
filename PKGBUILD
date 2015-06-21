# Maintainer: Evan Purkhiser <evanpurkhiser@gmail.com>

pkgname=mkinitcpio-colors-git
pkgdesc="mkinitcpio hook to set VT console colors during early userspace"
license=('MIT')
url="https://github.com/EvanPurkhiser/mkinitcpio-colors-git"
pkgver=9.5264b13
pkgrel=1

source=("$pkgname::git://github.com/EvanPurkhiser/mkinitcpio-colors")
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

    install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
