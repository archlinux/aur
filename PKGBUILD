# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Asuka Minato <asukaminato at nyan dot eu dot org>
pkgname=pdfcpu-bin
pkgver=0.4.0
pkgrel=1
epoch=
pkgdesc="A PDF processor written in Go."
arch=(x86_64 aarch64 i686)
url="https://github.com/pdfcpu/pdfcpu"
license=('Apache')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=(pdfcpu pdfcpu-git)
replaces=()
backup=()
options=()
install=
changelog=
source_x86_64=("pdfcpu-x86_64-${pkgver}-${pkgrel}.tar.xz::https://github.com/pdfcpu/pdfcpu/releases/download/v${pkgver}/pdfcpu_${pkgver}_Linux_x86_64.tar.xz")
source_aarch64=("pdfcpu-aarch64-${pkgver}-${pkgrel}.tar.xz::https://github.com/pdfcpu/pdfcpu/releases/download/v${pkgver}/pdfcpu_${pkgver}_Linux_arm64.tar.xz")
source_i686=("pdfcpu-i686-${pkgver}-${pkgrel}.tar.xz::https://github.com/pdfcpu/pdfcpu/releases/download/v${pkgver}/pdfcpu_${pkgver}_Linux_i386.tar.xz")
noextract=()
sha256sums_x86_64=('1dd1f08a94753ddd0842e97b709753aef963eec42f65813bb66814c6699f3cf9')
sha256sums_aarch64=('9d19aef2af0c95732142ca41c95743c614150e7971298c85568ff41cb32ad2fc')
sha256sums_i686=('93a9fc062ab49d3a8079efba7fd3a13cb9c8cf611d7e3aac9cce000ce05404dc')
validpgpkeys=()

package() {
        # there is only one folder, so I loop to find it and into it.
        for f in *;
        do
                if [ -d "$f" ] ; then
                        pushd "$f"
                        install -Dm755 pdfcpu -t $pkgdir/usr/bin/
                        install -Dm644 LICENSE.txt -t $pkgdir/usr/share/licenses/$pkgname/
                fi
        done
}
