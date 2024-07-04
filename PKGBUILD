# Maintainer: Lionel Miller <delonorm at gmail dot com>
# Maintainer: Marat Talipov <t-marat.yandex.ru>
# Maintainer: Andrey Kolchenko <andrey@kolchenko.me>

pkgname=kontur-plugin
pkgver=4.2.2.488
pkgrel=2
pkgdesc='Kontur.Plugin is an extension for web browsers that allows users to perform cryptographic operations in SKB Kontur services.'
arch=('x86_64')
license=('proprietary')
depends=(
    'gtk3'
    'cryptopro-csp-k1'
    'jacartauc'
)
url='https://help.kontur.ru/plugin/'
source=('https://help.kontur.ru/plugin/dist/kontur.plugin_amd64.deb')
sha256sums=('5c1f88b289a14698d1cba40da0502c3ce3c41ada44ae5c59dd821cddfac84bdb')

pkgver() {
    bsdtar -xf control.tar.gz
    grep 'Version:' control | cut -d ' ' -f 2
}

package() {
    bsdtar -xf data.tar.gz -C "$pkgdir/"
    rm -r "$pkgdir/usr/lib64/"  # /usr/lib64 is a symlink to /usr/lib
}
