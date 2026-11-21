# Maintainer: banana-bred <j.forer@posteo.net>

pkgname=fortran-fpm-bin
_name=fpm
pkgver=0.14.0
pkgrel=1
epoch=
pkgdesc='A Fortran package manager and build system'
arch=('x86_64')
url='https://fpm.fortran-lang.org/'
license=('MIT')
groups=()
depends=('git')
makedepends=()
checkdepends=()
optdepends=()
provides=("${pkgname%-bin}")
conflicts=("${_name}" "${pkgname%-bin}")
replaces=()
backup=()
options=()
install=
changelog=
_suf="-gcc-14"
noextract=()
source=(
  "https://github.com/fortran-lang/fpm/releases/download/v${pkgver}/${_name}-${pkgver}-linux-${arch}${_suf}"
  "https://raw.githubusercontent.com/fortran-lang/fpm/main/LICENSE"
)
sha256sums=('8dbc48ce5491cb862cfc1ec8740dcb2da0ec1555db079ace31a01b3a6e6f3437'
            'b7e33601c0130d1a674fcc772ed9b7804460d1896469a5b219ba4062efcd9fb9')

package() {
	install -Dm 755 "${srcdir}/${_name}-${pkgver}-linux-${arch}${_suf}" "${pkgdir}/usr/bin/${_name}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et :
