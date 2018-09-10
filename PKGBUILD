# Maintainer: Franc[e]sco <lolisamurai@tfwno.gf>

pkgname=shmupmametgm
pkgver=2.1
pkgrel=2
pkgdesc="Customized MAME for the TGM series. Forked for extra output options and tooling."
arch=('x86_64')
url="https://github.com/MaryHal/shmupmametgm"
depends=('sdl' 'gconf')
license=('GPL')
source=("https://github.com/MaryHal/shmupmametgm/archive/v2.1.tar.gz")
sha256sums=('7933b03f3921f026ab21c50cf7579cda98b669a2c5e60708c5e0524a715fe58c')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make SUBTARGET=tgm NOWERROR=1 || return 1
}

package() {
  basesrcdir="$srcdir/${pkgname}-${pkgver}"
  install -Dm755 "$basesrcdir/mametgm64" -t "$pkgdir/usr/bin/"
}

