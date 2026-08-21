# Maintainer: Andy Kluger <https://t.me/andykluger>
# Contributor: Markus Weimar <mail@markusweimar.de>
pkgver=2026.08.20
_upstream_ver='1787021892-1'
sha256sums=('5d9c2ccb73eb430f7433b76a6ba9dc6197762500c88ad157aab185c26bc627ae'
            '543d2059c3b896b7c1d48dc4057c5b3bdf52bb708212a1b00aee1dbe00a9ab77')

_repo_url='https://github.com/AndydeCleyre/archbuilder_iosevka'
_repo_branch='andysevka'

pkgname="ttf-${_repo_branch}"
pkgrel=1
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
