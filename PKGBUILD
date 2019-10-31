# Maintainer: Drew Nutter
pkgname=internxt-x-core-bin
pkgver=1.1.2
pkgrel=2
pkgdesc='Decentralized cloud storage server. Binary distribution from internxt.com.'
arch=('x86_64')
license=('AGPL-3.0')
url='https://www.internxt.com'
source=('internxt-x-core.deb::https://internxt.com/downloads/core.deb')
depends=('gtk3' 'libnotify' 'libnss_nis' 'libxss' 'libxtst' 'xdg-utils' 
         'at-spi2-core' 'libutil-linux' 'libappindicator-gtk3' 'libsecret')
sha256sums=('2e2bca3a201e8992085f83af88a5d58208e3720aa4adc29b91e172ef9b15b970')


package() {
    cd "$srcdir"
    tar -xf data.tar.xz -C "$pkgdir"
    tar -xf control.tar.gz
    mkdir -p "$pkgdir/usr/bin/"
    ln -sf '/opt/X Core/xcore' "$pkgdir/usr/bin/xcore"
    install -Dm644 "$startdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
