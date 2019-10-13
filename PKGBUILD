# Maintainer: Drew Nutter
pkgname=internxt-x-core-bin
pkgver=1.1.2
pkgrel=1
pkgdesc='Internxt X Core: decentralized cloud storage server. Binary distribution from internxt.com.'
arch=('x86_64')
license=('custom')
url='https://www.internxt.com'
source=('https://internxt.com/downloads/core.deb')
depends=('gtk3' 'libnotify' 'libnss_nis' 'libxss' 'libxtst' 'xdg-utils' 
         'at-spi2-core' 'libutil-linux' 'libappindicator-gtk3' 'libsecret')
sha256sums=('2e2bca3a201e8992085f83af88a5d58208e3720aa4adc29b91e172ef9b15b970')

package() {
    cd "$srcdir"
    tar -xf data.tar.xz -C "$pkgdir"
    tar -xvf control.tar.gz
    install -Dm755 postinst "$pkgdir/post_install.install"
    install -Dm755 postrm "$pkgdir/post_remove.install"
}
