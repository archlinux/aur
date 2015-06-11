# Maintainer: Stefan Seering <stefanarch@gmx.de>
pkgname=teamspeak-plugin-massmover
pkgver='0.57.20'
pkgrel='2'
pkgdesc='Plugin for Teamspeak 3. Allows moving several users at once.'
arch=('i686' 'x86_64')
url='http://addons.teamspeak.com/directory/plugins/miscellaneous/TS3MassMover.html'
license=('Unknown')
makedepends=('teamspeak3') # the teamspeak package contains C header files
depends=('teamspeak3')
source=('TS3MassMover-v0.57.20.zip::http://addons.teamspeak.com/directory/addon/download/TS3MassMover.html')
sha1sums=('c912cd911d66b3a3fe2b9c502f5b64cb72386ecc')

build() {
  cd -- "$srcdir/source"
  c++ ${CXXFLAGS} ${LDFLAGS} -shared -I /opt/teamspeak3/pluginsdk/include -fPIC -o TS3MassMover.so plugin.cpp
}

package() {
  cd -- "$srcdir/source"
  mkdir -p -- "$pkgdir/opt/teamspeak3/plugins"
  cp -- TS3MassMover.so "$pkgdir/opt/teamspeak3/plugins"
}

# vim:set ts=2 sw=2 et:
