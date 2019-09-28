# Maintainer: Nate Levesque <public@thenaterhood.com>
# Comaintainer : Erik Dubois <erik.dubois@gmail.com>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Zhengyu Xu <xzy3186@gmail.com>

pkgname=insync
pkgver=3.0.20.40428
pkgrel=4
_dist=buster
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
source=("http://s.insynchq.com/builds/${pkgname}_${pkgver}-${_dist}_amd64.deb")
sha256sums=('6112df3b92e658606632e853066fda234aba7d72c1417ea4f87978febe729349')
package() {
   tar xf data.tar.gz
   cp -rp usr ${pkgdir}/
   install -Dm644 ../insync@.service ${pkgdir}/usr/lib/systemd/system/insync@.service
   install -Dm644 ../insync.service ${pkgdir}/usr/lib/systemd/user/insync.service
   install -dm755  ${pkgdir}/usr/lib/x86_64-linux-gnu/gdk-pixbuf-2.0/2.10.0
   ln -s /usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache ${pkgdir}/usr/lib/x86_64-linux-gnu/gdk-pixbuf-2.0/2.10.0/loaders.cache
}
