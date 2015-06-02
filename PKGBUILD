# Maintainer: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# http://github.com/fukawi2/aur-packages
# Contributor: Daenyth <Daenyth+Arch AT gmail DOT com>
# Contributor: Kessia Pinheiro <kessiapinheiro at gmail.com>

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=pingtunnel
pkgver=0.72
pkgrel=1
pkgdesc="An application that tunnels TCP connections using ICMP echo request and reply packets."
url="http://www.cs.uit.no/~daniels/PingTunnel/index.html"
arch=('i686' 'x86_64')
license=('BSD')
depends=('libpcap')
source=("http://www.cs.uit.no/~daniels/PingTunnel/PingTunnel-${pkgver}.tar.gz")
md5sums=('c5f0c36d1a48d84ce7b5217f1ba52dd0')

build() {
  cd "$srcdir"/PingTunnel

  make
}

package() {
  cd "$srcdir"/PingTunnel

  make prefix="$pkgdir"/usr install

  install -D -m0644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
