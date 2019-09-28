# Maintainer: Nate Levesque <public@thenaterhood.com>
# Comaintainer : Erik Dubois <erik.dubois@gmail.com>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Zhengyu Xu <xzy3186@gmail.com>

pkgname=insync
pkgver=3.0.20.40428
pkgrel=2
_dist=fc30
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
source=("http://s.insynchq.com/builds/${pkgname}-${pkgver}-${_dist}.x86_64.rpm")
sha256sums=('caf516c998dd259ca09ecfd4689b4087ff9a79487d6450caea2ba109d2b83a20')
package() {
   #tar xf data.tar.gz
   cp -rp usr ${pkgdir}/
   install -Dm644 ../insync@.service ${pkgdir}/usr/lib/systemd/system/insync@.service
   install -Dm644 ../insync.service ${pkgdir}/usr/lib/systemd/user/insync.service
}
