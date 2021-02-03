# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: neo.shadowsocks<neo.shadowsocks AT gmx.com>
# Contributor: Kars Wang <jaklsy g-mail>

pkgname=lantern-bin
pkgver=6.4.0
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
sha256sums_i686=('8837e2ca0202088f0964b068c8191c7635f8f31869c64ebd9bf75685b43be348')
sha256sums_x86_64=('b19779a2d0e249aa0a4f936452d55f0c53d654630c30e243002a22901e636a09')

package() {
    msg2 'Extracting the data.tar.xz...'
    bsdtar -xzf data.tar.gz -C "${pkgdir}/"

    msg2 'Install systemd service file...'
    install -Dm644 "${srcdir}/lantern.service" "${pkgdir}/usr/lib/systemd/user/lantern.service"
}
