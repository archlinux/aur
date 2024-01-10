# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Maintainer: Truocolo <truocolo@aol.com>

_py="python"
_pkg="Daty"
pkgname=daty
pkgver="1.0beta"
pkgrel=1
pkgdesc='Daty Wikidata Editor'
url="https://gitlab.gnome.org/World/${_pkg}"
license=(
  'AGPLv3')
arch=(
  'x86_64')
depends=(
  'libhandy0'
  "${_py}-appdirs"
  "${_py}-bleach"
  "${_py}-beautifulsoup4"
  "${_py}-gobject"
  "${_py}-requests"
  "${_py}-setproctitle"
  "${_py}-pywikibot"
)
makedepends=(
  # 'git'
  "${_py}-setuptools"
)
provides=(
  "${_py}-${pkgname}"
)
groups=(
  gnome-extra
)
source=(
  # "${_pkg}-${pkgver}::git+${url}#tag=${pkgver}")
  "${url}/-/archive/${pkgver}/${_pkg}-${pkgver}.tar.gz")
sha512sums=(
  '4d2aae19b217d0a568c9ba0cfbe1df61fb2695bdec20f7ac4a8fccb9ea97bc8aa9135070c35835736371c880cea2621abb02c9ca2944d455bb66de1c777b4b61'
)

# shellcheck disable=SC2154
package() {
  cd \
    "${_pkg}-${pkgver}"
  "${_py}" \
    setup.py \
    install \
    --root="${pkgdir}" \
    --optimize=1
}

# vim:set sw=2 sts=-1 et:
