# Maintainer: hmarcelino <henry_marcelino at outlook dot com>
pkgname=hubstaff
pkgver=1.8.2
pkgrel=1
pkgdesc="Employee time tracking software for employees"
arch=('x86_64')
url="https://app.hubstaff.com"
license=('custom')
source=(
    "$url/download/11729-standard-linux-1-8-2-release/sh"
)
sha256sums=(
    'f6d8b712f4003151eed2ae87c5a0fd461ac35de234bdb53d74a286adec14f3ef'
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
