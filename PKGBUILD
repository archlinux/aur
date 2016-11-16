# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>
# Contributor: Ben Copeland <ben@copeland.me.uk>
pkgname=plexwatch
pkgver=0.3.3
pkgrel=3
pkgdesc="Notify and Log 'Now Playing' and 'Watched' content from a Plex Media Server + 'Recently Added' (...and more)"
arch=('any')
url="https://github.com/ljunkie/plexWatch"
license=('unknown')
depends=('plex-media-server'
         'perl-libwww'
         'perl-xml-simple'
         'perl-dbi'
         'perl-time-duration'
         'perl-time-modules'
         'perl-json'
         'perl-dbd-sqlite'
         'perl-io-socket-ssl'
         'perl-lwp-protocol-https')
optdepends=('perl-net-twitter: Required ONLY if you use twitter'
            'perl-net-oauth: Required ONLY if you use twitter'
            'perl-growl-gntp: Required ONLY if you use GNTP'
            'perl-net-smtp-ssl: Required ONLY if you use Email'
            'perl-file-readbackwards: Required ONLY if Client IP Logging is enabled')
source=("plexWatch.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('15cb0eb9f7376ae2f409e9dbb6fa5c5bb5d3549c69fe1e36e48ac016a81c38d4')

package() {
  cd "${srcdir}/plexWatch-${pkgver}"
  install -Dm 777 plexWatch.pl "${pkgdir}/opt/plexWatch/plexWatch.pl"
  install -Dm 755 config.pl-dist "${pkgdir}/opt/plexWatch/config.pl"
}


