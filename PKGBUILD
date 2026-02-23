# Maintainer: Dracape <Dracape at outlook dot com>

pkgname=arch-upgrader

# Version
pkgver=1.0.2
pkgrel=1

# Generic
pkgdesc='Update Arch: pacman & flatpak, rank mirrors, send notification on update and failure'
arch=(any)
url='https://github.com/Dracape/arch-upgrader'
license=('MIT')

# Dependencies
depends=('fish' 'rate-mirrors')
makedepends=('fish')
conflicts=('arch-upgrader-git')

# Download
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Dracape/${pkgname}/archive/refs/tags/${pkgver}.zip")
b2sums=('6da64bb79dbe525178859f743a97ee908e491a482eb01cef251f09de43f326c634a5dc1172c2bac0233e08fd8a4e221cdadce54320cd6de7f682481ac0245ca5')
install=systemd-reload.install


package() { "$pkgname-$pkgver"/install.fish --repository="$pkgname-$pkgver" --rootdir=${pkgdir}; }
