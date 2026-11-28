# Maintainer: Drazape <Drazape at outlook dot com>

pkgname=arch-upgrader

# Version
pkgver=1.1.1
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
b2sums=('978b59da781f1a8aa7ef285996904b676448e27a9a6c179d2cdde25de296a592ab5c496ac189d9b58495aac3e64b0a69f1a8d66a940a739e84a59d042a7c3b97')
install=systemd-reload.install


package() { "$pkgname-$pkgver"/install.fish --repository="$pkgname-$pkgver" --rootdir=${pkgdir}; }
