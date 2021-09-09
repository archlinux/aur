# Maintainer: Loic Coyle <loic.coyle@hotmail.fr>

_pkgname=shazam-cli
pkgname="${_pkgname}-git"
pkgver=r1.1d649b6
pkgrel=1
pkgdesc='CLI music recognition using the Shazam API.'
arch=('any')
url='https://github.com/loiccoyle/shazam-cli'
license=('MIT')
depends=('curl' 'jq' 'ffmpeg' 'libnotify')
optdepends=('dunst: recognition results in interactive notification.')
provides=('shazam-cli')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/loiccoyle/shazam-cli.git")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname}"
  install -D -m 755 shazam "${pkgdir}/usr/bin/shazam"
  install -D -m 755 shazam-notif "${pkgdir}/usr/bin/shazam-notif"
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
