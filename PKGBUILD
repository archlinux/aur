# Maintainer: Breno Martins da costa corrêa e Souza <breno.ec@gmail.com>
pkgname=jet-git
pkgver=1.0.1.r31.b9677cc
pkgrel=1
epoch=
pkgdesc="Persist or retrieve strings over streams."
arch=(x86_64 i686)
url="https://github.com/cognocoder/jet.git"
license=('MIT')
groups=()
depends=()
makedepends=(git gcc make)
checkdepends=()
optdepends=()
provides=(jet)
conflicts=(jet)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "${_pkgname}"
  printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd jet
	make build
}

package() {
	cd jet
  mkdir -p ${pkgdir}/opt/${pkgname}
  cp -rf * ${pkgdir}/opt/${pkgname}
	sudo make install
  sudo install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  sudo install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
