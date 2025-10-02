# Maintainer:

_pkgname="miniaudio"
pkgname="$_pkgname"
pkgver=0.11.23
pkgrel=1
pkgdesc="Header-only audio playback and capture library"
url="https://github.com/mackron/miniaudio"
license=('MIT')
arch=('any')

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/$pkgver.$_pkgext")
sha256sums=('1062155cc5882b55c48cb37f57a4dc783669e83ae0838535c62b206eeb1587a6')

package() {
  cd "$_pkgsrc"

  mkdir -pm755 "${pkgdir}/usr/include/miniaudio/extras/"
  install -m644 miniaudio.h -t "$pkgdir/usr/include/miniaudio/"
  install -m644 extras/*.h -t "$pkgdir/usr/include/miniaudio/extras/"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/miniaudio-git/LICENSE"
}
