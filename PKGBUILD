# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=dcaenc
pkgver=2
pkgrel=2
pkgdesc="A Free Software (LGPL-licensed) encoder for the DTS Coherent Acoustics audio format."
arch=(x86_64 i686)
url="http://aepatrakov.narod.ru/dcaenc/"
license=(LGPL)
depends=(alsa-lib)
options=(!libtool)
source=("http://aepatrakov.narod.ru/olderfiles/1/dcaenc-${pkgver}.tar.gz")
sha1sums=('786f93d7c07f8939b8d6331ee927e8024abd70a5')
sha512sums=('0029f7c3b06199fb8100ce933827013fdc58e5fddf984ddf1744849e5d6cc24ce76e09b868eef19a49e1036a142419c3304c1822492f64301ed4feaa6bea4910')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

check() {
  cd "${pkgname}-${pkgver}"
  make -k check
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
