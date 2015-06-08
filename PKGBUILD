# Maintainer: Mikael Eriksson <mikael_eriksson@miffe.org>

pkgname=plex-trakt-scrobbler-git
pkgver=v0.9.1.26.r1.g6d46cdd
pkgrel=1
pkgdesc="Add what you are watching on Plex to trakt.tv"
arch=('any')
url="https://github.com/trakt/Plex-Trakt-Scrobbler"
license=('Unknown')
depends=('plex-media-server')
makedepends=('git')
source=('git+http://github.com/trakt/Plex-Trakt-Scrobbler.git')
md5sums=('SKIP')

pkgver() {
  cd "Plex-Trakt-Scrobbler"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "Plex-Trakt-Scrobbler"
  mkdir -p "$pkgdir/opt/plexmediaserver/Resources/Plug-ins"
  mkdir -p "$pkgdir/var/lib/plex/Plex Media Server/Plug-ins"
  cp -r "Trakttv.bundle" "$pkgdir/opt/plexmediaserver/Resources/Plug-ins"
  ln -s "/opt/plexmediaserver/Resources/Plug-ins/Trakttv.bundle" "$pkgdir/var/lib/plex/Plex Media Server/Plug-ins"
  chmod a=,u=rwX,go=rX -R "$pkgdir"
}

# vim:set ts=2 sw=2 et:
