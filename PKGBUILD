# Maintainer: XMgVwrR6jCWDM75
_gitname="torrents.csv"
_gitver="0"
_gitbranch="master"

pkgname="torrents.csv-git"
pkgver=0.r176.24cf3d0
pkgrel=1
pkgdesc="Torrents.csv is a self hostable, open source torrent search site and database"
arch=(any)
url="https://gitlab.com/dessalines/torrents.csv"
license=('GPL3')
groups=()
depends=('rust'
         'yarn'
         'sqlite'
	 'jq'
	 'ripgrep')
makedepends=('git'
             'npm'
             'nodejs')
optdepends=()
provides=('torrents.csv')
replaces=()
backup=()
options=('!strip')
changelog=
source=("git+https://gitlab.com/dessalines/torrents.csv.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  printf "%s.r%s.%s" "${_gitver}" "$(git rev-list --count ${_gitbranch})" "$(git rev-parse --short  ${_gitbranch})"
}

prepare() {
:
}

build() {
:
}

package() {
	install -d ${pkgdir}/opt/torrents.csv
	rm -rf ${_gitname}/.git
	cp -R ${_gitname} ${pkgdir}/opt/
}


