# Maintainer Robert Booster > boosterdev@linuxmail.org
# Automatic builder > https://github.com/boosterdev/autobuild

_commit="5bf3bef1dd63d9d81a75ac60479a95e19bfe4f75"
pkgname=booster-gtk-themes
pkgver=20170220
pkgrel=1
arch=('any')
url="https://github.com/boosterdev/booster-themes"
license=('GPL3')
depends=('gtk3' 'gtk-engine-murrine' 'ttf-ubuntu-font-family')
optdepends=('arc-firefox-theme: visual integration for firefox')
makedepends=('git')
source=("${pkgname}::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git log -1 --format="%cd" --date=short | tr -d '-'
}

build() {
  cd "${pkgname}"
  ./autogen.sh --prefix=/usr
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
}
