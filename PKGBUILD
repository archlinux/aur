# Maintainer: Lionel Miller <delonorm at gmail dot com>
# Maintainer: Marat Talipov <t-marat.yandex.ru>
# Maintainer: Andrey Kolchenko <andrey@kolchenko.me>

pkgname=kontur-plugin
pkgver=4.0.6.244
pkgrel=1
pkgdesc='Kontur.Plugin is an extension for web browsers that allows users to perform cryptographic operations in SKB Kontur services.'
arch=('x86_64')
license=('proprietary')
depends=(
    'gtk3'
    'cryptopro-csp-k1'
)
url='https://help.kontur.ru/plugin/'
source=('https://help.kontur.ru/plugin/dist/kontur.plugin_amd64.deb')
sha256sums=('efa0d0f0f7fa5a3ddc827508249e629da85bd143088d766ec8dd0c4cd0b658f3')

pkgver() {
    bsdtar -xf control.tar.gz
    grep 'Version:' control | cut -d ' ' -f 2
}

package() {
    bsdtar -xf data.tar.gz -C "$pkgdir/"
    rm -r "$pkgdir/usr/lib64/"  # /usr/lib64 is a symlink to /usr/lib
}
