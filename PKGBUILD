# Maintainer: Jakub "Kubuxu" Sztandera  <kubuxu@protonmail.ch>
pkgname=teamspeak3-pluginsdk
pkgver=3.0.18.1
pkgrel=1
pkgdesc="Headers for TeamSpeak3 PluginSDK"
arch=('any')
url="https://www.teamspeak.com/"
license=('custom')
makedepends=('unzip')
source=("http://dl.4players.de/ts/client/pluginsdk/pluginsdk_$pkgver.zip")
noextract=("pluginsdk_$pkgver.zip")
md5sums=('dc4744e8df949b7109d8d3633a79f259')

prepare() {
  unzip -o "pluginsdk_$pkgver.zip"
}

package() {
  install -d "$pkgdir/usr/include/teamspeak3/"{,teamlog/,teamspeak/} 
  install -m644 -t "$pkgdir/usr/include/teamspeak3/" "$srcdir/pluginsdk/include/"*.h
  install -m644 -t "$pkgdir/usr/include/teamspeak3/teamlog/" "$srcdir/pluginsdk/include/teamlog/"*.h
  install -m644 -t "$pkgdir/usr/include/teamspeak3/teamspeak/" "$srcdir/pluginsdk/include/teamspeak/"*.h
}
# vim: set expandtab ts=2 sw=2:
