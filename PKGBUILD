# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: neo.shadowsocks<neo.shadowsocks AT gmx.com>
# Contributor: Kars Wang <jaklsy g-mail>

pkgname=lantern-bin
pkgver=6.7.1
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
sha256sums_i686=('e3436675625034083ba590ce593d8c4ca76175651609cfc9e66abc0cd6d069e3')
sha256sums_x86_64=('4d319c9bbea9c3f3f5045a5d74eca1b73df177e5201c3494fe762051f22afd47')

package() {
    msg2 'Extracting the data.tar.xz...'
    bsdtar -xzf data.tar.gz -C "${pkgdir}/"

    msg2 'Install systemd service file...'
    install -Dm644 "${srcdir}/lantern.service" "${pkgdir}/usr/lib/systemd/user/lantern.service"
}
