# Maintainer: Nate Levesque <public@thenaterhood.com>
# Comaintainer : Erik Dubois <erik.dubois@gmail.com>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Zhengyu Xu <xzy3186@gmail.com>

pkgname=insync
pkgver=3.0.19
_pkgver=40421
_dist=bionic
pkgrel=1
pkgdesc="An unofficial Google Drive client that runs on Linux, with support for various desktops"
url="https://www.insynchq.com/downloads"
license=('custom:insync')
options=(!strip)
depends=('xdg-utils'
         'glibc'
         'python2'
         'libglvnd'
         'nss'
         'libxcursor'
         'libxi'
         'libxtst'
         'libxrandr'
         'alsa-lib'
         'libxcomposite')
optdepends=()
arch=('x86_64')
source=('insync@.service' 'insync.service')
md5sum=('fbf05bead8c90d5fd18a1ba14147acf7'
	    '7d416b57ed52fe3daf71bae1af563657')
source=("http://s.insynchq.com/builds/${pkgname}_${pkgver}.${_pkgver}-${_dist}_amd64.deb")
sha256sums=('906a8f37103afc3e181cf129bf31041ff6c813d84a48baf8592034554c51d11b')
package() {
   tar xf data.tar.gz
   cp -rp usr ${pkgdir}/
   install -Dm644 ../insync@.service ${pkgdir}/usr/lib/systemd/system/insync@.service
   install -Dm644 ../insync.service ${pkgdir}/usr/lib/systemd/user/insync.service
}
