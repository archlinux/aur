# Maintainer: Loic Coyle <loic.coyle@hotmail.fr>

_pkgname=cuff
pkgname="${_pkgname}-git"
pkgver=r16.b3db6b0
pkgrel=1
pkgdesc='Query the Jackett search API from the command line.'
arch=('any')
url='https://github.com/loiccoyle/cuff'
license=('MIT')
depends=('curl' 'jq')
optdepends=('jackett: Use many torrent trackers with software that supports torznab/potato feeds.')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/loiccoyle/cuff.git")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname}"
  install -D -m 755 cuff "${pkgdir}/usr/bin/cuff"
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -D -m 644 completions/zsh "${pkgdir}/usr/share/zsh/site-functions/_cuff"
}
