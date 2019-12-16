# Maintainer: ahbnr <anton dot haubner at outlook dot de>

pkgname=chat-bin
pkgver=r49.1bcb047
pkgrel=1
pkgdesc="Simple p2p cli chat application."
arch=('i686' 'x86_64')
url="https://github.com/ahbnr/chat"
license=('GPL3')
depends=('glibc>=2.28' 'zlib>=1.2.11' 'gmp>=6.1.2')
makedepends=('curl')
replaces=()
conflicts=('chat-git' 'chat-bin' 'chat-irc-bin' 'chat-irc-git')
provides=('chat')
backup=()
options=()
install=
source=('https://ahbnr.de/jenkins/job/chat/lastSuccessfulBuild/artifact/chat' 'https://ahbnr.de/jenkins/job/chat/lastSuccessfulBuild/artifact/version')
noextract=()
md5sums=('SKIP' 'SKIP')

pkgver() {
  cat "$srcdir/version"
}

build() {
  chmod +x "$srcdir/chat"
}

package() {
  binary="chat"

  strip -s "${binary}"

  mkdir -p "$pkgdir/usr/bin"
  cp "${binary}" "$pkgdir/usr/bin"
}
