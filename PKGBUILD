# Maintainer: Your Name <your.email@example.com>
pkgname=perssua
pkgver=0.21.1
pkgrel=1
pkgdesc="Your AI companion for LeetCode - because sometimes we all feel stupid"
arch=('x86_64')
url="https://perssua.com"
license=('custom:proprietary')
depends=('nss' 'alsa-lib' 'gtk3' 'libxss') # common electron dependencies
source=("${pkgname}-${pkgver}.deb::https://downloads.perssua.com/Perssua-${pkgver}-amd64.deb")
sha256sums=('ec07d10b3e360ebd922bd6c16430267f20ff1b05af4b149fc7499db34a5f148e')

package() {
    # Extract data.tar.*
    bsdtar -xf data.tar.* -C "${pkgdir}"
    
    # Symlink the executable to /usr/bin/perssua so it's in PATH
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/Perssua/perssua" "${pkgdir}/usr/bin/perssua"
}
