# Maintainer: Nate Levesque <public@thenaterhood.com>
# Contributor: Erik Dubois <erik.dubois@gmail.com>
# Contributor: tinywrkb <tinywrkb@gmail.com>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Zhengyu Xu <xzy3186@gmail.com>
# Source : new application - https://forums.insynchq.com

pkgname=insync-headless
pkgver=3.0.0.10585
pkgrel=2
_dist=buster
pkgdesc="Google Drive and OneDrive headless client"
url="https://www.insynchq.com/downloads"
license=('custom:insync')
options=(!strip)
depends=('cron'
         'glibc')
optdepends=()
arch=('x86_64')
source=("http://s.insynchq.com/builds/${pkgname}_${pkgver}-${_dist}_amd64.deb"
        'insync-headless@.service'
        'insync-headless.service')
sha256sums=('a9e19b6f639c21fcec6c9060a090bf12588d95afaa00da3f5d109060522f3c55'
            'b8dd2876fc0aa2eb75081fe5f819f544029627c4bcdbbd4b829da8b46b5dcc46'
            '1f84e70294a6f242fa7a32a3508e1d43c36dd0f89f675d324cc104dd28ffaa18')
package() {
   tar xf data.tar.gz
   cp -rp usr ${pkgdir}/
   install -Dm644 insync-headless@.service ${pkgdir}/usr/lib/systemd/system/insync-headless@.service
   install -Dm644 insync-headless.service ${pkgdir}/usr/lib/systemd/user/insync-headless.service
}
