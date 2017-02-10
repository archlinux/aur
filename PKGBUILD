# Maintainer: Izzy <somewhere@qq.com>
# Contributor:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: neo.shadowsocks<neo.shadowsocks AT gmx.com>
# Contributor: Kars Wang <jaklsy g-mail>
pkgname=lantern-newest
pkgver=3.6.3
pkgrel=1
pkgdesc='Free desktop application that delivers fast, reliable and secure access to the open Internet. (Stable Channel, binary)'
arch=('i686' 'x86_64')
url='https://getlantern.org'
license=('Apache')
depends=('libappindicator-gtk3')
options=('!emptydirs' '!strip' '!docs')
conflicts=('lantern' 'lantern-headless' 'lantern-headless-git' 'lantern-git' 'lantern-bin')
provides=('lantern')
source=('lantern.service')
source_i686=('https://raw.githubusercontent.com/getlantern/lantern-binaries/master/lantern-installer-beta-32-bit.deb')
source_x86_64=('https://raw.githubusercontent.com/getlantern/lantern-binaries/master/lantern-installer-beta-64-bit.deb')
sha256sums=('fdece37945be10c00210bbde7b4058c356ef1df0554bd963fcddd12990ff930b')
sha256sums_i686=('e2131622026d59a35eae81ccfe68b5902f6e5e8a1a42f6e93bb948576b3c4af0')
sha256sums_x86_64=('fe60104205e7edd7867da0f33bd6e50300183f6f1fcfef6ddef65e3812f1318a')

package() {
    msg2 'Extracting the data.tar.xz...'
    bsdtar -xf data.tar.xz -C "${pkgdir}/"

    msg2 'Install systemd service file...'
    install -Dm644 "${srcdir}/lantern.service" "${pkgdir}/usr/lib/systemd/user/lantern.service"
}
