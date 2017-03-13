# Maintainer: Marius O<marius@habarnam.ro>
pkgname=coedit-bin
pkgver=3_gold
pkgrel=1
pkgdesc="Coedit is an IDE for the DMD D2 compiler."
url="https://github.com/BBasile/Coedit"
license=('MIT')
makedepends=("unzip")
optdepends=("dlang")
provides=("coedit")
arch=("x86" "x86_64")
if test "$CARCH" == x86_64; then
  _arch="64"
else
  _arch="32"
fi
source=("https://github.com/BBasile/Coedit/releases/download/${pkgver}/${pkgname%-bin}.${pkgver//_}.linux${_arch}.zip")

sha256sums=('382875060928607f85deeb91786160f18570f90730fdde246298c7f62bdf4e17')
package() {
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/icons"
    mkdir -p "${pkgdir}/usr/share/applications"


    _dir="${pkgname%-bin}-${CARCH}"
	cd "${srcdir}/${_dir}"

    cp coedit "${pkgdir}/usr/bin"
    cp cesyms "${pkgdir}/usr/bin"
    cp cetodo "${pkgdir}/usr/bin"
    cp coedit.png "${pkgdir}/usr/share/icons"
    cp ../../coedit.desktop "${pkgdir}/usr/share/applications"
}
