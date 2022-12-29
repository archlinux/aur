# Maintainer: Loic Coyle <loic.coyle@hotmail.fr>

_pkgname=prowlet
pkgname="${_pkgname}-git"
pkgver=r5.6f9be29
pkgrel=1
pkgdesc='Query the Prowlarr search API from the command line.'
arch=('any')
url='https://github.com/loiccoyle/prowlet'
license=('MIT')
depends=('curl' 'jq')
optdepends=('Prowlarr: Usenet and torrent aggregator, similar to nzbhydra2 and jackett.')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/loiccoyle/prowlet.git")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname}"
  install -D -m 755 prowlet "${pkgdir}/usr/bin/prowlet"
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -D -m 644 completions/zsh "${pkgdir}/usr/share/zsh/site-functions/_prowlet"
}
