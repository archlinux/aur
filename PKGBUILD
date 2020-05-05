# Maintainer: Lucas Rooyakkers <lucas dot rooyakkers at pm dot me>

pkgname='cvodes'
provides=('cvodes')
pkgver=2.7.0
pkgrel=1
pkgdesc="CVODES is a solver for stiff and nonstiff ODE systems given in explicit form y’ = f(t,y,p) with sensitivity analysis capabilities (both forward and adjoint modes)."
arch=('any')
url="https://www.gnu.org/software/mcsim/#installation"
license=("BSD")
conflicts=('sundials')
optdepends=()
makedepends=('gcc')
source=("https://www.gnu.org/software/mcsim/${pkgname}-${pkgver}.tar.gz")
md5sums=('73d924b697c1b13ec1b5172057bdf6ab')

prepare() {
       cd "${srcdir}/${pkgname}-${pkgver}"

       ./configure --prefix=/usr
}

build() {
       cd "${srcdir}/${pkgname}-${pkgver}"

       make
}

package() {
       cd "${srcdir}/${pkgname}-${pkgver}"

       make prefix="$pkgdir/usr/" install
}
