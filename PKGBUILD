# Maintainer: valvetime <valvetimepackages@gmail.com>
pkgname=telive
pkgver=a69bec
pkgrel=1
pkgdesc="TETRA live monitor"
arch=('any')
url="https://github.com/sq5bpf/telive"
license=('GPL3')
groups=()
depends=('gnuradio' 'gnuradio-companion' 'python2' 'alsa-utils' 'vorbis-tools' 'sox')
makedepends=('git')
optdepends=('google-earth: view SIP location reports on a map')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(${pkgname}::"git+https://github.com/sq5bpf/telive")
noextract=()
md5sums=('SKIP')

build() {
 cd "$srcdir/$pkgname"

  make
}

package() {

 cd "$srcdir/$pkgname"

 T=$pkgdir/tetra
  mkdir -p "$T/in" "$T/out" "$T/log" "$T/tmp" "$T/bin"
 
 cp bin/* $T/bin
  touch $T/log/telive.log

cp -r $srcdir/telive $pkgdir/tetra
}
