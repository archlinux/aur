# Maintainer: Yiyao Yu <yuydevel at protonmail dot com>
# Author: Himprakash Deka <himprakashd at gmail dot com>

pkgname=utterly-round-plasma-style
pkgver=2.1
pkgrel=4
pkgdesc='A rounded Desktop theme and Window borders for Plasma 5 that follows
any color scheme'
url='https://github.com/HimDek/Utterly-Round-Plasma-Style'
_commit='7e011c19382f8afa99daac3226828ce82eaf4f13'
arch=('any')
license=('GPL2')
depends=('kwin')
makedepends=('git')
optdepends=( 'utterly-nord-plasma: complementing color scheme')
source=("${pkgname}::git+${url}.git#commit=${_commit}")
sha256sums=('SKIP')
_theme_base='Utterly-Round'

_package_and_rename() {
  local _src="$1"
  local _dst="$2"
  mkdir -p "${_dst}"
  cd "${_src}"
  find -type f -exec \
    install -Dm 644 '{}' "${_dst}/{}" \;
}

package() {
  cd "${srcdir}/${pkgname}"

  # aurorae
  _package_and_rename \
    "${srcdir}/${pkgname}/aurorae/dark/translucent" \
    "${pkgdir}/usr/share/aurorae/themes/${_theme_base}-Dark"

  _package_and_rename \
    "${srcdir}/${pkgname}/aurorae/dark/solid" \
    "${pkgdir}/usr/share/aurorae/themes/${_theme_base}-Dark-Solid"

  _package_and_rename \
    "${srcdir}/${pkgname}/aurorae/light/translucent" \
    "${pkgdir}/usr/share/aurorae/themes/${_theme_base}-Light"

  _package_and_rename \
    "${srcdir}/${pkgname}/aurorae/light/solid" \
    "${pkgdir}/usr/share/aurorae/themes/${_theme_base}-Light-Solid"

  # desktop theme
  _package_and_rename \
    "${srcdir}/${pkgname}/desktoptheme/translucent" \
    "${pkgdir}/usr/share/plasma/desktoptheme/${_theme_base}"

  _package_and_rename \
    "${srcdir}/${pkgname}/desktoptheme/solid" \
    "${pkgdir}/usr/share/plasma/desktoptheme/${_theme_base}-Solid"
}

# vim:set et ts=2 sw=2 tw=79:
