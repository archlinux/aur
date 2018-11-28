# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>

pkgname=sopcast
pkgver=3.2.6
pkgrel=2
pkgdesc="The Streaming Direct Broadcast System based on P2P"
arch=('x86_64')
url="http://www.sopcast.org"
license=('custom')
depends_x86_64=('lib32-libstdc++5')
depends_i686=('libstdc++5')
install=sopcast.install
source=("http://download.easetuner.com/download/sp-auth.tgz"
        'license')
sha512sums=('8460c51eb2fb4e8f00595d813f8dcf910154f9d9fc12d0bebc3b71be7f263b4987605391e61a94fb0118508a768ebd2732d1618f7cc6fe71d0e8adfc15d4c096'
            'ba5828a3590329b8da028c7eeca07bd8c49f644082d1bf5823b2674a21e72c7a70c1a7366fb49a731f2df9ca521202a61dd051a18f8e4062ad833c101837d7da')

package()  {
  install -D -m755 sp-auth/sp-sc-auth "${pkgdir}/usr/bin/sp-sc-auth"
  ln -s sp-sc-auth "${pkgdir}/usr/bin/sopcast"
  ln -s sp-sc-auth "${pkgdir}/usr/bin/sp-sc"
  install -D license "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
