# Maintainer: Lionel Miller <delonorm at gmail dot com>
# Maintainer: Marat Talipov <t-marat.yandex.ru>
# Maintainer: Andrey Kolchenko <andrey@kolchenko.me>

pkgname=kontur-plugin
pkgver=4.7.1.1274
pkgrel=1
pkgdesc='Kontur.Plugin is an extension for web browsers that allows users to perform cryptographic operations in SKB Kontur services.'
arch=('x86_64')
license=('proprietary')
depends=(
    'gtk3'
    'cryptopro-csp-k1'
    'jacartauc'
)
url='https://help.kontur.ru/plugin/'
source=('https://api.kontur.ru/drive/v1/public/diag/files/kontur.plugin.002245.deb')
sha256sums=('3ac6af6a79e8091e24c65c16ed121c0e9a232317ff7f0d1b2c1637a076a76974')

pkgver() {
    bsdtar -xf control.tar.gz
    grep 'Version:' control | cut -d ' ' -f 2
}

package() {
    bsdtar -xf data.tar.gz -C "$pkgdir/"
    rm -r "$pkgdir/usr/lib64/"  # /usr/lib64 is a symlink to /usr/lib
}
