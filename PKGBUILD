# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=chromecast-wallpapers
pkgver=2.0
pkgrel=1
pkgdesc="700 Google Chromecast background images"
url="http://chromecastbg.alexmeub.com/"
arch=('any')
license=('custom')
source=(gdrive-download.py)
makedepends=(python-requests)

_source_gdrive_id="0B1FX0RxrL5WeUU8tRHdWa0M0aXM"
_source_sha256sum="1ef311714bb97004544ad9165a8498526f34f588bda591dd9ac7ff7d52a1a807"
_source_filename="$pkgname-$pkgver.zip"

package() {
  "${srcdir}"/gdrive-download.py "${_source_gdrive_id}" "${_source_filename}"
  echo "${_source_sha256sum} ${_source_filename}" | sha256sum -c

  install -d -m755 "${pkgdir}"/usr/share/wallpapers/
  bsdtar xf "${_source_filename}" -C "${pkgdir}"/usr/share/wallpapers/
}

# vim:set ts=2 sw=2 et:
sha256sums=('f778abeee2b410eed75f405223a112680a02850aa425b8f924ed40dd32d384c8')
