# Maintainer: Santiago Pestarini <santiagonob (a) gmail.com>
# Contributor: Luis Cuadrado <luiscuadrado123 (a) gmail.com>
pkgname=bricscad-legacy
pkgver=13.2.17
pkgrel=1
pkgdesc="BricsCad is a CAD program with Autodesk DWG compatibility."
arch=(any)
url="https://www.bricsys.com"
license=('commercial')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=

source=("bricscadv13.2.17.tar.gz::https://drive.google.com/uc?export=download&id=0B_T6TjcdUPW2UDhXb1J6VWRqbGs"
	"bricscad_simple_logo.png::https://drive.google.com/uc?export=download&id=0B_T6TjcdUPW2azd0elpMcndIUmc"
	"bricscad.desktop::https://drive.google.com/uc?export=download&id=0B_T6TjcdUPW2TGxiQ1ZCN2dqMVk"
	"bricscad13::https://drive.google.com/uc?export=download&id=0B_T6TjcdUPW2NkVMZUNuZk9FN0k")

md5sums=('2ca6f4b512b9e9ac51e54d53c9edfb25'
	'c24313275d36fa6db16d92d530862739'
	'aa602524fb3687cbf1fab63ee6ea7077'
	'b90151309e0ea94b1f1cee9e6960418c')

noextract=("bricscadv13.2.17.tar.gz")

build() {
    # Extract the tarball
    cd ${srcdir}
    tar xzf bricscadv13.2.17.tar.gz
}

package() {
    # Create directories
    install -dm755 ${pkgdir}/{opt/${pkgname},usr/{bin,share/applications}}
    # Copy the files
    cd ${srcdir}
    cp -R bricscad ${pkgdir}/opt/${pkgname}/
    install -Dm644 bricscad_simple_logo.png ${pkgdir}/opt/${pkgname}/bricscad/
    install -Dm644 bricscad.desktop         ${pkgdir}/usr/share/applications/
    install -Dm755 bricscad13               ${pkgdir}/usr/bin/
    # Create a link in /usr/bin
    #ln -s /opt/${pkgname}/bricscad/bricscad.sh ${pkgdir}/usr/bin/bricscad13
}
