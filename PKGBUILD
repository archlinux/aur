# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Ederson Ferreira <edersondeveloper@gmail.com>
pkgname=gomarkpdf-edersonferreira-git
pkgver=1.1.r.
pkgrel=1
epoch=
pkgdesc="A Markdown to PDF transformer"
arch=(x86_64 i686)
url="https://github.com/edersonferreira/gomarkpdf"
license=('MIT')
groups=()
depends=()
makedepends=(git go)
checkdepends=()
optdepends=()
provides=(gomarkpdf)
conflicts=(gomarkpdf)
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
	printf "1.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  go get -u github.com/edersonferreira/gomarkpdf
}

package() {
    cd gomarkpdf
    mkdir -p ${pkgdir}/opt/${pkgname}
    cp -rf * ${pkgdir}/opt/${pkgname}
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.org"
}
