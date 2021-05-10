# Maintainer:  Sky Xie <skyxie@foxmail.com>

pkgname=lantern-beta
pkgver=beta
pkgrel=1
pkgdesc='Free desktop application that delivers fast, reliable and secure access to the open Internet.'
arch=('i686' 'x86_64')
url='https://getlantern.org'
license=('Apache')
depends=('libappindicator-gtk3')
options=('!emptydirs' '!strip' '!docs')
conflicts=('lantern' 'lantern-headless' 'lantern-headless-git' 'lantern-git' lantern-bin'')
provides=('lantern')
source=('lantern.service')
conflicts=('lantern' 'lantern-git' 'lantern-headless' 'lantern-headless-git')
source_i686=("https://raw.githubusercontent.com/getlantern/lantern-binaries/master/lantern-installer-preview-32-bit.deb")
source_x86_64=("https://raw.githubusercontent.com/getlantern/lantern-binaries/master/lantern-installer-preview-64-bit.deb")
sha256sums=('SKIP')
sha256sums_i686=('SKIP')
sha256sums_x86_64=('SKIP')

package() {
    msg2 'Extracting the data.tar.xz...'
    bsdtar -xzf data.tar.gz -C "${pkgdir}/"

    msg2 'Install systemd service file...'
    install -Dm644 "${srcdir}/lantern.service" "${pkgdir}/usr/lib/systemd/user/lantern.service"
}
