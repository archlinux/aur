# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: neo.shadowsocks<neo.shadowsocks AT gmx.com>
# Contributor: Kars Wang <jaklsy g-mail>

pkgname=lantern-bin
pkgver=6.2.9
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
source_i686=("${pkgname}-${pkgver}-i686.deb::https://s3.amazonaws.com/lantern/lantern-installer-${pkgver}-32-bit.deb")
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::https://s3.amazonaws.com/lantern/lantern-installer-${pkgver}-64-bit.deb")
sha256sums=('fdece37945be10c00210bbde7b4058c356ef1df0554bd963fcddd12990ff930b')
sha256sums_i686=('3c202c8dfaa62e5caf1a3bd6588ccdbd5734b6972b908e1d5b387b9ba1de0fb0')
sha256sums_x86_64=('adece35c813ac4e2ef1ff78e08b690aa5288ba709490b9a4b5a95e853e2d1808')

package() {
    msg2 'Extracting the data.tar.xz...'
    bsdtar -xzf data.tar.gz -C "${pkgdir}/"

    msg2 'Install systemd service file...'
    install -Dm644 "${srcdir}/lantern.service" "${pkgdir}/usr/lib/systemd/user/lantern.service"
}
