# Maintainer: puzzle9 <happypuzzle@126.com>

_pkgname='vlc-materia-skin'
pkgname="${_pkgname}-git"
pkgver=r8.37a061e
pkgrel=1
pkgdesc="Materia Skin for VLC"
arch=('any')
url="https://github.com/PapirusDevelopmentTeam/materia-vlc"
license=('GPL')
depends=('vlc')
makedepends=('git' 'tar')
provides=(${_pkgname})
conflicts=(${_pkgname})
install='vlc-materia-skin.install'
source=(git+https://github.com/PapirusDevelopmentTeam/materia-vlc.git)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/materia-vlc"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/materia-vlc/Materia"
  tar -czf "${srcdir}/materia-git.tar.gz" *
}

package() {
  mkdir -p "${pkgdir}/usr/share/vlc/skins2/"
  install -Dm644 "${srcdir}/materia-git.tar.gz" "${pkgdir}/usr/share/vlc/skins2/materia-git.vlt"
}
