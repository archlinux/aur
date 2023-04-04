# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
_pkgname=obs-captions-plugin
_gitname=OBS-captions-plugin
pkgname=${_pkgname}-bin
pkgver=0.28
pkgrel=1
pkgdesc='Standalone OBS Studio plugin providing closed captioning via Google Cloud Speech Recognition API'
arch=('x86_64')
url="https://github.com/ratwithacompiler/${_gitname}"
license=("GPL")
conflicts=("${_pkgname}")
depends=('obs-studio>=28' 'qt6-tools')
_zipfile="Closed_Captions_Plugin__v${pkgver}_Linux.zip"
source=("$url/releases/download/v${pkgver}/$_zipfile")
b2sums=('9e0c312d4b7117bc31afce1a9103b54b566883ab1506196de9803b60e29e7d98bd26e38ff14b137519fa7e249f14f8847c2e80e7c9be4d5b011934cf614ad840')

package() {
    cd "${_zipfile%.*}"
    install -Dm644 -t $pkgdir/usr/lib/obs-plugins/ libobs_google_caption_plugin/bin/64bit/libobs_google_caption_plugin.so
    install -Dm644 -t $pkgdir/usr/share/doc/$_pkgname/ Readme.md
}
