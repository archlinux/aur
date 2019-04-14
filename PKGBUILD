# Maintainer : Daniel T. Borelli <danieltborelli@gmail.com>
# Contributor: sekret
# Contributor: flu

pkgname=flvlc
pkgver=3.4
pkgrel=2
pkgdesc='FLTK media player by libvlc'
arch=('x86_64')
url='https://github.com/spycapitan/flvlc'
license=('GPL3')
depends=('fltk' 'vlc')
makedepends=('git' 'make' 'pkg-config')
options=('!buildflags')
source=("git+${url}.git?signed#tag=v${pkgver}"
        "flvlc.desktop"
        "flvlc.png"
        )

sha256sums=('SKIP'
            '43c8e129b4cd3d17121a675acb46f8d7e216b2e754f95b1e786b6890a0133a3c'
            '4238f6017fc34cd88bef6f98db33f690f00cd03f02da326b8a5c83bb6bf8133c'
            )

validpgpkeys=('51479755D90A2AACFA90A6551DD242462908D08B')


build() {
  cd "$srcdir/flvlc" && make release
}

package() {
  install -Dm755 "$srcdir/flvlc/flvlc" "$pkgdir/usr/bin/flvlc"
  install -Dt "$pkgdir/usr/share/doc/flvlc/" -m644 "$srcdir/flvlc/README.md"
  install -Dt "$pkgdir/usr/share/applications" -m644 "flvlc.desktop" 
  install -Dt "$pkgdir/usr/share/pixmaps" -m644 "flvlc.png"
}

