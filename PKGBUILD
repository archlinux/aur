# Maintainer: Georg Potthast <nospam at georgpotthast.de>
pkgname=netrider-bin
pkgver=0.94
pkgrel=1
pkgdesc="Webkit based browser"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/netrider/"
license=('BSD')
groups=()
depends=('libxft' 'libxinerama' 'gcc' 'sqlite' 'curl' 'libxslt' 'libxtst')
makedepends=('libarchive')

md5sums=('SKIP')
if [ "${CARCH}" = 'x86_64' ]; then
  #md5sums=('b99e5d60f167f2dca62d10fa02cfca30')
  _archname="x86_64"
elif [ "${CARCH}" = 'i686' ]; then
  #md5sums=('cd50258ce581f77ad6c648e72a1f1e66')
  _archname="i586"
fi

source=("http://downloads.sourceforge.net/project/netrider/NetRider-$pkgver-$pkgrel.$_archname.rpm")

build() {
  cd "${srcdir}"
  bsdtar -xf "NetRider-$pkgver-$pkgrel.$_archname.rpm"
}

package() {
  mkdir -p "$pkgdir/usr"
  cp -R --preserve=timestamps "$srcdir/usr/local/bin" "$pkgdir/usr"
  cp -R --preserve=timestamps "$srcdir/usr/local/lib" "$pkgdir/usr" || :
  cp -R --preserve=timestamps "$srcdir/home/netrider" "$pkgdir/home"
}
