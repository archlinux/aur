# Maintainer : Daniel T. Borelli <danieltborelli@gmail.com>
# Contributor: sekret
# Contributor: flu

pkgname=flvlc
pkgver=2.5
pkgrel=0
pkgdesc='FLTK media player by libvlc'
arch=('x86_64')
url='https://github.com/spycapitan/flvlc'
license=('GPL3')
depends=('fltk' 'vlc')
makedepends=('git' 'cmake')
options=('!buildflags')
source=("git+${url}.git?signed#tag=v${pkgver}"
        "flvlc.desktop"
        "flvlc.png"
        )

sha256sums=('SKIP'
            'b326132810e70f7b99bf3e353c43de46fed3320e81aa462a3ee6ece8e9bebd45'
            '4238f6017fc34cd88bef6f98db33f690f00cd03f02da326b8a5c83bb6bf8133c'
            )

validpgpkeys=('51479755D90A2AACFA90A6551DD242462908D08B')


build() {
  cd "$srcdir/flvlc" &&  cmake -DCMAKE_BUILD_TYPE=Release && make
}

package() {
  install -Dm755 "$srcdir/flvlc/flvlc" "$pkgdir/usr/bin/flvlc"
  install -Dt "$pkgdir/usr/share/applications" -m644 "flvlc.desktop" 
  install -Dt "$pkgdir/usr/share/pixmaps" -m644 "flvlc.png"
}

