# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD
# shellcheck disable=SC2148,SC2034,SC2154,SC2164
# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
_pkgname=obs-captions-plugin
_gitname=OBS-captions-plugin
pkgname=${_pkgname}-bin
pkgver=0.32
pkgrel=1
pkgdesc='Standalone OBS Studio plugin providing closed captioning via Google Cloud Speech Recognition API'
arch=('x86_64' 'x86_64_v3')
url="https://github.com/ratwithacompiler/${_gitname}"
license=('GPL-2.0-or-later')
conflicts=("${_pkgname}")
depends=('obs-studio>=30' 'qt6-tools')
_zipfile="Closed_Captions_Plugin__v${pkgver}_Linux.zip"
source=("$url/releases/download/v${pkgver}/$_zipfile")
b2sums=('09bfa24c80428360b90c7536fe00235331a4db0b4649ef3baa528305c7b1a8a0a498da8fef47e7f06ad033491a18aa4f82fdbebfa99875c2ac41ffd980df3edf')

package() {
    cd "${_zipfile%.*}"
    install -Dm644 -t "${pkgdir}"/usr/lib/obs-plugins/ libobs_google_caption_plugin/bin/64bit/libobs_google_caption_plugin.so
    install -Dm644 -t "${pkgdir}"/usr/share/doc/"${_pkgname}"/ Readme.md
}
