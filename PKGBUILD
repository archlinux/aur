# Maintainer: Dean Thomson < mrrobot at fsociety dot info >
pkgname=steamforwarder
pkgver=0.2.2
pkgrel=1
pkgdesc="steam_api.dll implementation for Wine. Windows games now can interact with the Linux Steam runtime."
arch=(i686 x86_64)
url="https://github.com/xomachine/SteamForwarder"
license=('MIT')
depends=('python' 'steamcmd' 'wine' 'steam')
source=("https://github.com/xomachine/steamforwarder/releases/download/$pkgver/redist.tar.bz2")
sha256sums=('356eb3956b5ddf5ce6bc2e5dfaf520d2700d8fa41a7533a71d0f3d46da43c2bd')
install=steamforwarder.install

prepare() {
    cd "${srcdir}/redist"
}

package() {
    cd "${srcdir}/redist"
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/lib"
    install -m 755 app_install.py "$pkgdir/usr/bin/app_install"
    install -m 755 libsteam_api.so "$pkgdir/usr/lib"
    install -m 755 steam_api.dll.so "$pkgdir/usr/lib"
}



