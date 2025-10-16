# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD
# shellcheck shell=bash disable=SC2034,SC2154,SC2164
# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
_pkgname=obs-captions-plugin
_gitname=OBS-captions-plugin
pkgname=${_pkgname}-bin
pkgver=0.33
pkgrel=1
pkgdesc='Standalone OBS Studio plugin providing closed captioning via Google Cloud Speech Recognition API'
arch=('x86_64' 'x86_64_v3')
url="https://github.com/ratwithacompiler/${_gitname}"
license=('GPL-2.0-or-later')
conflicts=("${_pkgname}")
depends=('obs-studio>=30' 'qt6-tools')
_zipfile="Closed_Captions_Plugin__v${pkgver}_Linux.zip"
source=("$url/releases/download/v${pkgver}/$_zipfile")
b2sums=('39c195937d5a354705aca596173985a3ffe764cb3e81071a1199a0634bfaf60266de9d5ec3428d1f303cbc55010ca5c21aa5de6d960bb04458af1a9ae55035cf')

package() {
    cd "${_zipfile%.*}"
    install -Dm644 -t "${pkgdir}"/usr/lib/obs-plugins/ libobs_google_caption_plugin/bin/64bit/libobs_google_caption_plugin.so
    install -Dm644 -t "${pkgdir}"/usr/share/doc/"${_pkgname}"/ Readme.md
}
