# Maintainer: Lionel Miller <delonorm at gmail dot com>
# Maintainer: Marat Talipov <t-marat.yandex.ru>

pkgname=kontur-plugin
pkgver=4.0.4.202
pkgrel=1
pkgdesc="Kontur.Plugin is an extension for web browsers that allows users to perform cryptographic operations in SKB Kontur services."
arch=('x86_64')
_filename="kontur.plugin_amd64.deb"
license=('proprietary')
depends=(
    'gtk3'
    'cryptopro-csp-k1'
)
url="https://help.kontur.ru/plugin/"
source=("https://help.kontur.ru/plugin/beta/dist/$_filename")
sha512sums=('25355f4b0da5cd25c1fb00cf973c3765e1973fd86d0a7dcc92c864b5660932cf257126fdc5ef05b65b9c4828abcfd73b720c8b368fd634a200417f3f9e881502')

package() {
    bsdtar -xf data.tar.gz -C "$pkgdir/"
    rm -r "$pkgdir/usr/lib64/"  # /usr/lib64 is a symlink to /usr/lib
}