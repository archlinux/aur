# Maintainer:  Sky Xie <skyxie@foxmail.com>

pkgname=lantern-beta
pkgver=4.1.2
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
provides=('lantern')
source=('lantern.service')
source_i686=("${pkgname}-${pkgver}-i686.deb::https://github.com/getlantern/lantern-binaries/raw/238a2b64fd7c69ad89721c53885e84d4a6b7268e/lantern-installer-beta-32-bit.deb")
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::https://github.com/getlantern/lantern-binaries/raw/238a2b64fd7c69ad89721c53885e84d4a6b7268e/lantern-installer-beta-64-bit.deb")
sha256sums=('fdece37945be10c00210bbde7b4058c356ef1df0554bd963fcddd12990ff930b')
sha256sums_i686=('a8c26d603d1f98548c6c71b1431f5ea702250c84be8d63f8eddfc34a006ac3a4')
sha256sums_x86_64=('4cab6a373f5e1704048bdef94052f8c990c8a1a877a60db9caa685a2d1d2ae26')

package() {
    tar Jxf data.tar.xz -C "${pkgdir}/"
    install -Dm644 "${srcdir}/lantern.service" "${pkgdir}/usr/lib/systemd/user/lantern.service"
}
