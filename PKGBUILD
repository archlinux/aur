# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: neo.shadowsocks<neo.shadowsocks AT gmx.com>
# Contributor: Kars Wang <jaklsy g-mail>

pkgname=lantern-bin
pkgver=2.2.5
pkgrel=1
pkgdesc='Free desktop application that delivers fast, reliable and secure access to the open Internet. (Stable Channel, binary)'
arch=('i686' 'x86_64')
url='https://getlantern.org'
license=('Apache')
depends=('libappindicator-gtk3')
options=('!emptydirs' '!strip' '!docs')
conflicts=('lantern' 'lantern-headless' 'lantern-headless-git' 'lantern-git')
provides=('lantern')
source=('lantern.service')
source_i686=('https://raw.githubusercontent.com/getlantern/lantern-binaries/master/lantern-installer-32-bit.deb')
source_x86_64=('https://raw.githubusercontent.com/getlantern/lantern-binaries/master/lantern-installer-64-bit.deb')
sha256sums=('fdece37945be10c00210bbde7b4058c356ef1df0554bd963fcddd12990ff930b')
sha256sums_i686=('187b4a22ce8c1c906887fd235aaf50c08b6aa26a5f2aa0122d3cf93552ce0339')
sha256sums_x86_64=('04ea25f644a227ff15c79a6621fdf843b7c55f3f4a0b1713b98a730882884cda')

package() {
    msg2 'Extracting the data.tar.xz...'
    bsdtar -xf data.tar.xz -C "${pkgdir}/"

    msg2 'Install systemd service file...'
    install -Dm644 "${srcdir}/lantern.service" "${pkgdir}/usr/lib/systemd/user/lantern.service"
}
