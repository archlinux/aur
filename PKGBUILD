# Maintainer: Thomas Rijpstra <thomas at fourlights dot nl>

_pkgname=kanri
pkgname=kanri-bin
pkgver=0.7.1
pkgrel=2
pkgdesc="Modern offline Kanban board app using tauri"
arch=('x86_64')
url="https://github.com/kanriapp/kanri"
license=('GPL-3.0-or-later')
depends=('webkit2gtk')
makedepends=('binutils')  # 'ar' is part of the binutils package
source=("${_pkgname}_${pkgver}.deb::https://github.com/kanriapp/kanri/releases/download/app-v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('240ba8e18a43bd633d8b48f0759a29f0174849cb8e40c9af2f79a010b8ff3db6')

package() {
    msg2 "Extracting the .deb package..."
    ar x "${srcdir}/${_pkgname}_${pkgver}.deb"

    msg2 "Extracting the data..."
    tar xf data.tar.gz -C "$pkgdir"

    # Remove DEBIAN directory as it's not needed in Arch
    rm -rf "$pkgdir/DEBIAN"
}

