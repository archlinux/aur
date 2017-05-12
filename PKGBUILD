# Maintainer: Jakub "Kubuxu" Sztandera  <kubuxu@protonmail.ch>
# Contributor: Kacper "KocproZ" Stasiuk <kocproz@protonmail.com>
pkgname=teamspeak3-pluginsdk
pkgver=3.1.1.1
pkgrel=1
pkgdesc="Headers for TeamSpeak3 PluginSDK"
arch=('any')
url="https://www.teamspeak.com/"
license=('custom')
makedepends=('unzip')
source=("http://dl.4players.de/ts/client/pluginsdk/pluginsdk_$pkgver.zip")
noextract=("pluginsdk_$pkgver.zip")
sha256sums=('ee788e81dc7d515a538175cda92f68ba114b503e226fe726689f3e5264abdcaf')

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
