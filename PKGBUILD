# Maintainer: JOLIMAITRE Matthieu <matthieu@imagevo.fr>
pkgname="vivlio"
pkgver=2.2.1
pkgrel=1
pkgdesc="Application Vivlio pour Mac / Windows / Linux"
url="https://app.vivlio.com"
arch=('x86_64')
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libappindicator' 'libsecret')
source=("vivlio.deb::https://my.vivlio.com/desktop/download/linux64/deb")
sha256sums=('SKIP')

package() {
    ar x vivlio.deb
    tar -xf data.tar.xz
    cp -fr opt usr "$pkgdir/"
}

pkgver() {
    zcat control.tar.gz | grep --text 'Version:' | cut -d ' ' -f 2 | cut -d '-' -f 1
}
