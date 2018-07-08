# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: neo.shadowsocks<neo.shadowsocks AT gmx.com>
# Contributor: Kars Wang <jaklsy g-mail>

pkgname=lantern-bin
pkgver=4.7.6
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
source_i686=("${pkgname}-${pkgver}-i686.deb::https://raw.githubusercontent.com/getlantern/lantern-binaries/master/lantern-installer-32-bit.deb")
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::https://raw.githubusercontent.com/getlantern/lantern-binaries/master/lantern-installer-64-bit.deb")
sha256sums=('fdece37945be10c00210bbde7b4058c356ef1df0554bd963fcddd12990ff930b')
sha256sums_i686=('c4950c6da1671346d8e867acde39a9aa676b6a241c8b529ae83c51ab67d66379')
sha256sums_x86_64=('a1816cfa8596a7f1a9eec2457ea686891ba060da3f015733a737eadaacebc21f')

package() {
    msg2 'Extracting the data.tar.xz...'
    bsdtar -xf data.tar.xz -C "${pkgdir}/"

    msg2 'Install systemd service file...'
    install -Dm644 "${srcdir}/lantern.service" "${pkgdir}/usr/lib/systemd/user/lantern.service"
}
