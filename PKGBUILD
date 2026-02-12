# Maintainer: Andy Kluger <https://t.me/andykluger>
# Contributor: Markus Weimar <mail@markusweimar.de>
pkgver=2026.01.05
_upstream_ver='1767748971-1'
sha256sums=('04b5824007f38d83c646b84d8d41ac440bf9727548a1cd322ce833deaa8363c7'
            'dce6900c47c9732f7731b1bebb1916874c2cbffce4f567b06338878ca8893289')

_repo_url='https://github.com/AndydeCleyre/archbuilder_iosevka'
_repo_branch='andysevka'

pkgname="ttf-${_repo_branch}"
pkgrel=3
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
