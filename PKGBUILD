# Maintainer:  Sky Xie <skyxie@foxmail.com>

pkgname=lantern-beta
pkgver=4.1.4
pkgrel=1
pkgdesc='Free desktop application that delivers fast, reliable and secure access to the open Internet.'
arch=('i686' 'x86_64')
url='https://getlantern.org'
license=('Apache')
options=('!emptydirs' '!strip' '!docs')
install=$pkgname.install
depends=('libappindicator-gtk3' 'xcb-util' 'xdg-utils')
makedepends=('go>=1.6' 'make' 'git' 'npm')
conflicts=('lantern' 'lantern-git' 'lantern-headless' 'lantern-headless-git')
provides=('proxy' 'network')
source=('lantern.service')
source_i686=("${pkgname}-${pkgver}-i686.deb::https://github.com/getlantern/lantern-binaries/raw/182af25d821b1a25adb28f6bd2974acea15fea06/lantern-installer-beta-32-bit.deb")
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::https://github.com/getlantern/lantern-binaries/raw/182af25d821b1a25adb28f6bd2974acea15fea06/lantern-installer-beta-64-bit.deb")
sha256sums=('fdece37945be10c00210bbde7b4058c356ef1df0554bd963fcddd12990ff930b')
sha256sums_i686=('552324f565c6b7c312861876600aeff8af3e64c992e47cbe58c5bf148928eeb0')
sha256sums_x86_64=('2070c3bff89471f081e746edf82ce0f6d70b9bbf75a65661f8fe0689a69adcd3')

package() {
    tar Jxf data.tar.xz -C "${pkgdir}/"
    install -Dm644 "${srcdir}/lantern.service" "${pkgdir}/usr/lib/systemd/user/lantern.service"
}
