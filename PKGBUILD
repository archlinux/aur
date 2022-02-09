#!/bin/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# Contributor: Fabien Devaux <fdev31@gmail.com>

_name="manuelbastionilab"
pkgname="blender-plugin-${_name}"
pkgver=1.7.8.5
_dir="MB-Lab-${pkgver}"
pkgrel=1
pkgdesc="powerful 3d humanoids creator"
arch=('any')
url="https://mb-lab-community.github.io"
license=('GPL')
source=("${pkgname}_${pkgver}.tar.gz::https://github.com/animate1978/MB-Lab/archive/refs/tags/${pkgver//_/.}.tar.gz")
sha256sums=('3e392ce1b04a97f627e22d4ebac19e0f32232ed7908a0777b80d69656b30721d')

package() {
  depends=('blender')
  _blender=$(pacman -Sddp --print-format %v blender|grep -oP '(?<=\:)[[:digit:]]+\.[[:digit:]]+(?=\.)')
  cd ${_dir}
  addons="$pkgdir/usr/share/blender/${_blender}/scripts/addons"
  install -dm755 "${addons}/${_name}"
  cp -a -t "${addons}/${_name}" ./*
}

# vim:set ts=2 sw=2 et:
