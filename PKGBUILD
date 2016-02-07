# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=lv2file
pkgver=0.84
pkgrel=1
pkgdesc="A command line program to process audio files with LV2 plugins"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/jeremysalwen/lv2file"
license=('GPL3')
depends=('argtable' 'libsndfile' 'lilv')
source=("https://github.com/jeremysalwen/lv2file/archive/upstream/0.84.tar.gz"
        "https://raw.githubusercontent.com/jeremysalwen/lv2file/master/debian/lv2file.1")
md5sums=('259719c6291d4b774db3e3a485e12d18'
         'f6b06337c3a87051d47d533c2b88addd')

build() {
  cd "${srcdir}/${pkgname}-upstream-${pkgver}"

  make all
}

package() {
  cd "${srcdir}/${pkgname}-upstream-${pkgver}"

  make DESTDIR="$pkgdir" install
  install -Dm 644 "$srcdir/${pkgname}.1" \
    "$pkgdir/usr/share/man/man1/${pkgname}.1"
}

# vim:set ts=2 sw=2 et:
