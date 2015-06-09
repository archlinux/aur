# Maintainer: "UnCO" Lin <trash__box <_at_> 163.com>

pkgname=ffmpeg-static-bin
pkgver=2.5.3
pkgrel=1
pkgdesc="Universal multimedia toolkit static build (binary)"
#epoch=0
arch=('i686' 'x86_64')
license=('GPL')
url="http://johnvansickle.com/ffmpeg/"

_arch='32bit'
[ "$CARCH" = 'x86_64' ] && _arch='64bit'

_pkgname=ffmpeg-${pkgver}-${_arch}-static
source=("http://johnvansickle.com/ffmpeg/releases/ffmpeg-release-${_arch}-static.tar.xz")
md5sums=()
if [ "$CARCH" = 'x86_64' ]; then
  md5sums+='be61559de31bee8309b8375da36e30b7'
else
  md5sums+='6b44fc4e7780aec619e06fab338d6483'
fi

package() {
  cd "$srcdir/$_pkgname"
  mkdir -p "$pkgdir"/usr/bin/
  mkdir -p "$pkgdir"/usr/share/${pkgname}/doc
  find . -executable -type f -exec install -m755 {} "$pkgdir"/usr/bin/{} \;
  cp -a manpages readme.txt "$pkgdir"/usr/share/${pkgname}/doc/
  cp -a presets "$pkgdir"/usr/share/${pkgname}/
}

# vim:set ts=2 sw=2 et:

