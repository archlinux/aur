# Maintainer: hmarcelino <henry_marcelino at outlook dot com>
pkgname=hubstaff
pkgver=1.7.8
pkgrel=1
pkgdesc="Employee time tracking software for employees"
arch=('x86_64')
url="https://app.hubstaff.com"
license=('custom')
source=(
    "$url/download/11100-standard-linux-1-7-8-release/sh"
)
sha256sums=(
    'f10ac08eefa0d5df32c6e93ceb710d75b3c725ad9f762114ff51aed073596633'
)

install="uninstall.install"

options=('!strip')

build() {
    chmod +x sh
    ./sh -- --silent --destination "/home/$USER/.local/bin/$pkgname"
}

package() {
    mkdir -vp "$pkgdir/usr/share/licenses"
    cp -rp "/home/$USER/.local/bin/$pkgname/LICENSES/" "$pkgdir/usr/share/licenses/$pkgname"
    cp -p "/home/$USER/.local/bin/$pkgname/NOTICE" "$pkgdir/usr/share/licenses/$pkgname/"
}
