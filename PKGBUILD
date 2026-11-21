# Maintainer: Sibren Vasse <arch at sibrenvasse dot nl>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Leo von Klenze <aur@leo.von-klenze.de>

pkgname=jquery
pkgver=4.1.0
pkgrel=1
pkgdesc="Cross-platform JavaScript library designed to simplify the client-side scripting of HTML"
arch=('any')
url='https://jquery.com/'
license=('MIT')
source=(
  "https://code.jquery.com/jquery-${pkgver}.js"
  "https://code.jquery.com/jquery-${pkgver}.min.js"
  "https://code.jquery.com/jquery-${pkgver}.min.map"
  "https://code.jquery.com/jquery-${pkgver}.slim.js"
  "https://code.jquery.com/jquery-${pkgver}.slim.min.js"
  "https://code.jquery.com/jquery-${pkgver}.slim.min.map"
  "https://code.jquery.com/jquery-${pkgver}.module.js"
  "https://code.jquery.com/jquery-${pkgver}.module.min.js"
  "https://code.jquery.com/jquery-${pkgver}.module.min.map"
  "https://code.jquery.com/jquery-${pkgver}.slim.module.js"
  "https://code.jquery.com/jquery-${pkgver}.slim.module.min.js"
  "https://code.jquery.com/jquery-${pkgver}.slim.module.min.map"
  "jquery-${pkgver}-LICENSE::https://raw.githubusercontent.com/jquery/jquery/${pkgver}/LICENSE.txt"
)
sha256sums=('3f822571821f3a7dd8074ce06b864986bb7f39dc233ab29242c77143291570ce'
            '86346f3e414b3b52466453171abcdda46e9396c1c3ca3a783d07aa2d645c3339'
            '13f44978c3687de15208f6c159e81682252a14c065f4f2b28b583e2c6f4b43b9'
            'eb0fc212f80e74b01272afdc5fa6803dcbb84c8fe678ce1222b7bb0c468e758a'
            'd33ade10d3d44102886c604a189e96176f3d8d9cfd4b763add35110d04c28677'
            '1a208c5726c670e4ab35017263295f4364b8b5f86d4d4b261377f11e2df55703'
            '4e382ad96d752c3d4232bf1ebc049d3e0461f2c0182a933983795f7bcce062ca'
            '4f7f6727c562c77437f082ad2d088d82c94d0d1982b102a601adf89446900333'
            'cf26c91b93564191fbf593b22cd5113aa85377f4cf57de5ffd46789d3587837e'
            'cd1f116c4703b72390bbd8f70a43e98b5a90544f75eb07a42e76b8a50ece1668'
            '5d1394a7db73119e680a44a8158e0944a6127595270ae33fe4188a4dd86c80ba'
            '361f7c8d0f2f2213b8b9fc87fdf4626c68029be8530dce805ee7b852cedde8bf'
            'd4db9ebe6f29f5168eac45ad713f055623ac5d0dcd5ba92da23d650ae012020d')

package() {
  local _file
  local _dest="${pkgdir}/usr/share/javascript/${pkgname}"

  install -d "${_dest}"

  for _file in \
    js \
    min.js \
    min.map \
    slim.js \
    slim.min.js \
    slim.min.map \
    module.js \
    module.min.js \
    module.min.map \
    slim.module.js \
    slim.module.min.js \
    slim.module.min.map; do
    install -m644 \
      "${srcdir}/jquery-${pkgver}.${_file}" \
      "${_dest}/jquery.${_file}"
  done

  install -Dm644 \
    "${srcdir}/jquery-${pkgver}-LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
