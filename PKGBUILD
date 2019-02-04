# Maintainer: Formed <formed@tuta.io>
# Contributor: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=viper4linux-git
pkgver=r39.56d258e
pkgrel=2
pkgdesc="Implementation of the libviper library for modern Linux desktops."
arch=('x86_64')
url="https://github.com/L3vi47h4N/Viper4Linux"
license=('GPL')
depends=('gst-plugin-viperfx' 'gst-plugins-good')
source=("$pkgname"::'git+https://github.com/L3vi47h4N/Viper4Linux.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    mkdir "${pkgdir}/etc/"
    cp -r "${pkgname}/viper4linux/" "${pkgdir}/etc"
    install -Dm755 "${pkgname}/viper" "${pkgdir}/usr/bin/viper"
}
