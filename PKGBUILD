# Maintainer: buckket <buckket@cock.li>

pkgname=liberation-circuit
pkgver=0.99
pkgrel=1
pkgdesc="A real-time strategy/programming game"
arch=("x86_64" "i686")
license=("GPL3")
url="https://github.com/linleyh/liberation-circuit"
depends=("allegro")
makedepends=("redo")
source=("$pkgname::git+https://github.com/linleyh/liberation-circuit.git#commit=b1798ca89d662ec45e5e300a02438f482300e017"
        "https://github.com/linleyh/liberation-circuit/releases/download/beta/LibCirc_v0.99_beta.zip"
        "libcirc")
sha256sums=('SKIP'
            '2ba9bc1fa53b962656fcf370da452821c8170c0573c73495c99953e4f1caca5f'
            '2560ef7dd15ec609177b2330e075d6414421b4a4ed857873675cd748b511d54a')

build() {
  cd liberation-circuit/src
  redo
}

package() {
  install -Dm755 libcirc "${pkgdir}/usr/bin/libcirc"
  install -dm755 "${pkgdir}/usr/share/games/${pkgname}"
  install -Dm755 "liberation-circuit/src/g_game" "${pkgdir}/usr/share/games/${pkgname}/libcirc"
  rm "LibCirc beta/allegro-5.0.10-monolith-mt.dll"
  rm "LibCirc beta/LibCirc.exe"
  rm "LibCirc beta/libcirc.do"
  cp -rf "LibCirc beta"/* "${pkgdir}/usr/share/games/${pkgname}"
}

