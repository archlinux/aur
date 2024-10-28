# Maintainer: Thomas Rijpstra <thomas at fourlights dot nl>

_pkgname=kanri
pkgname=kanri-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Modern offline Kanban board app using tauri"
arch=('x86_64')
url="https://github.com/kanriapp/kanri"
license=('GPL-3.0-or-later')
depends=('webkit2gtk')
makedepends=('binutils')  # 'ar' is part of the binutils package
source=("${_pkgname}_${pkgver}.deb::https://github.com/kanriapp/kanri/releases/download/app-v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('2167ee75c66d8ed1d7a6c8455ec2c7e86fc696c3ba3b9bfdc1f6e50092882d89')

package() {
    msg2 "Extracting the .deb package..."
    ar x "${srcdir}/${_pkgname}_${pkgver}.deb"

    msg2 "Extracting the data..."
    tar xf data.tar.gz -C "$pkgdir"

    # Remove DEBIAN directory as it's not needed in Arch
    rm -rf "$pkgdir/DEBIAN"
}

