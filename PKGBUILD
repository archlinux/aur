# Maintainer: Gabriel Ortega <coffelius@gmail.com>
pkgname=rofi-code-git
pkgrel=2
epoch=
pkgver=0.2.r1.gf804543
pkgdesc="Use rofi to quickly open Visual Studio Code or Codium workspaces."
arch=($CARCH)
url="https://www.github.com/Coffelius/rofi-code"
license=('MIT')
groups=()
depends=('rofi')
makedepends=(
    'git'
    'go'
    )
checkdepends=()
optdepends=()
provides=(rofi-code)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname}"
    make dist
}

package() {
    cd "${srcdir}/${pkgname}"
    install -DT rofi-code "${pkgdir}/usr/bin/rofi-code"
    install -DT LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -DT README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
