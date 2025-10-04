# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD
# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
_pkgname=obs-captions-plugin
_gitname=OBS-captions-plugin
pkgname=${_pkgname}-bin
pkgver=0.31
pkgrel=3
pkgdesc='Standalone OBS Studio plugin providing closed captioning via Google Cloud Speech Recognition API'
arch=('x86_64' 'x86_64_v3')
url="https://github.com/ratwithacompiler/${_gitname}"
license=('GPL-2.0-or-later')
conflicts=("${_pkgname}")
depends=('obs-studio>=28' 'qt6-tools')
_zipfile="Closed_Captions_Plugin__v${pkgver}_Linux.zip"
source=("$url/releases/download/v${pkgver}/$_zipfile")
b2sums=('ba7f8bd8ee8c84d94d88da038e4cad174e8b45454c4164fd5bf0637ebecc4f80472d4e7486dc024df62d5aae29c0739dca17e77c65449714f0c762d39e1f359e')

package() {
    cd "${_zipfile%.*}"
    install -Dm644 -t $pkgdir/usr/lib/obs-plugins/ libobs_google_caption_plugin/bin/64bit/libobs_google_caption_plugin.so
    install -Dm644 -t $pkgdir/usr/share/doc/$_pkgname/ Readme.md
}
