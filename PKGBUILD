# Maintainer: Andy Kluger <https://t.me/andykluger>
# Contributor: Markus Weimar <mail@markusweimar.de>
pkgver=2026.01.05
_upstream_ver='1767495037-1'
sha256sums=(
  '4e3095c6eedc5af416275e343f84b60fd7eb6cd4b9c74673c5d5fb363dc76a4c'
  'ee5832ec1163e3fbeb257a7c218ead80aff291036bd3813f7ddc8b9506fdac51'
)

_repo_url='https://github.com/AndydeCleyre/archbuilder_iosevka'
_repo_branch='andysevka'

pkgname="ttf-${_repo_branch}"
pkgrel=2
pkgdesc='A configured build of Iosevka (TTF, WOFF2; Spacings: Term, Proportional)'
arch=('any')
url="${_repo_url}/tree/${_repo_branch}"
license=('custom:OFL')
source=(
  "${_repo_url}/releases/download/${_repo_branch}-${pkgver}/ttf-iosevka-term-custom-git-${_upstream_ver}-any.pkg.tar.zst"
  "${_repo_url}/releases/download/${_repo_branch}-${pkgver}/ttf-iosevka-quasi-proportional-custom-git-${_upstream_ver}-any.pkg.tar.zst"
)

package () {
  mv usr/share/licenses/ttf-iosevka-term-custom-git "usr/share/licenses/ttf-${_repo_branch}"
  rm -r usr/share/licenses/ttf-iosevka-*git
  cp -a usr "${pkgdir}/"
}
