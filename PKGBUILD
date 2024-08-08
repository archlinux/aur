# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
_pkgname=obs-captions-plugin
_gitname=OBS-captions-plugin
pkgname=${_pkgname}-bin
pkgver=0.30
pkgrel=1
pkgdesc='Standalone OBS Studio plugin providing closed captioning via Google Cloud Speech Recognition API'
arch=('x86_64')
url="https://github.com/ratwithacompiler/${_gitname}"
license=("GPL")
conflicts=("${_pkgname}")
depends=('obs-studio>=28' 'qt6-tools')
_zipfile="Closed_Captions_Plugin__v${pkgver}_Linux.zip"
source=("$url/releases/download/v${pkgver}/$_zipfile")
b2sums=('152949d80082741374b39acfe100dce26bb06f58334b766bd5ad14e2ec9a9c8b5a4461232b887dc6fa89962368683151d27fad4769bf31c3c6dee95e8d61e16e')

package() {
    cd "${_zipfile%.*}"
    install -Dm644 -t $pkgdir/usr/lib/obs-plugins/ libobs_google_caption_plugin/bin/64bit/libobs_google_caption_plugin.so
    install -Dm644 -t $pkgdir/usr/share/doc/$_pkgname/ Readme.md
}
