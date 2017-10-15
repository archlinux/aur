# Maintainer: Valentin-Costel Haloiu <vially.ichb+aur@gmail.com>

pkgname=volumectl
pkgver=0.0.5
pkgrel=1
pkgdesc="A command line utility to control the volume"
arch=('i686' 'x86_64')
url="https://github.com/vially/volumectl"
options=('!strip')
license=(MIT)
depends=('pulseaudio' 'notify-osd')
makedepends=('go' 'git')

_gourl=github.com/vially/volumectl
_gitroot="https://github.com/vially/volumectl.git"

build() {
  export GOPATH="$srcdir"
  go get -x -v ${_gourl}
}

package() {
  install -Dm755 "$srcdir/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/src/$_gourl/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
