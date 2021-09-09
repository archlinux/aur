# Maintainer: Loic Coyle <loic.coyle@hotmail.fr>

_pkgname=audd-cli
pkgname="${_pkgname}-git"
pkgver=r8.ea1d0c8
pkgrel=1
pkgdesc='CLI music recognition using the AudD API.'
arch=('any')
url='https://github.com/loiccoyle/audd-cli'
license=('MIT')
depends=('curl' 'jq' 'ffmpeg' 'libnotify')
optdepends=('dunst: recognition results in interactive notification.')
provides=('audd-cli')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/loiccoyle/audd-cli.git")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname}"
  install -D -m 755 audd "${pkgdir}/usr/bin/audd"
  install -D -m 755 audd-notif "${pkgdir}/usr/bin/audd-notif"
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
