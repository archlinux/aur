# Maintainer: Drazape <Drazape at outlook dot com>

pkgname=arch-upgrader

# Version
pkgver=1.1.0
pkgrel=2

# Generic
pkgdesc='Update Arch: pacman & flatpak, rank mirrors, send notification on update and failure'
arch=(any)
url='https://github.com/Drazape/arch-upgrader'
license=('MIT')

# Dependencies
depends=('fish' 'rate-mirrors' 'gnome-console')
makedepends=('fish')
conflicts=('arch-upgrader-git')

# Download
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Drazape/${pkgname}/archive/refs/tags/${pkgver}.zip")
b2sums=('143207b3781552457e203ef91a115c20d0c2a00f90888a6531dc026dfe0eabd731bec2322e7ddfcad52fa3cbc101a25cbb65b5716029b5fb0ff775bb78717a2d')
install=systemd-reload.install


package() { "$pkgname-$pkgver"/install.fish --repository="$pkgname-$pkgver" --rootdir=${pkgdir}; }
