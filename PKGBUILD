# Maintainer: lesebas <sebdelignyatgmaildotcom>
# Contributor: sausageandeggs <sausageandeggs@archlinux.us>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>

pkgname=cairo-dock-plug-ins-extras
pkgver=3.4.0
pkgrel=2
pkgdesc="Extra plugins for cairo-dock"
arch=(any)
url=https://launchpad.net/$pkgname
license=(GPL3 LGPL3)
depends=('cairo-dock-plug-ins>=3.4.0' 'python-dbus')
optdepends=('bsdmainutils: calendar'
    'deluge: Deluge'
    'gtg: GTG'
    'kdeplasma-addons-applets-lancelot: lancelot'
    'ktorrent: KTorrent'
    'mintmenu: MintMenu'
    python2-dbus
    'python-sgmllib: Google'
    vala)
source=($url/${pkgver:0:3}/$pkgver/+download/${pkgname}_$pkgver.tar.gz)
md5sums=('52051a4f7404137fffe9650c92a46f53')

package() {
    _datadir=$(pkg-config gldi --variable=pluginsdatadir)

    install -d "$pkgdir"/$_datadir/Dbus/third-party/
    cp -r ${pkgname}_$pkgver/* "$pkgdir"/$_datadir/Dbus/third-party/
}