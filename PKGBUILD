_appname=omikhleia-sile-packages
_builddir=build

pkgname=${_appname}-git
pkgver=20211212.7693970
pkgrel=1
pkgdesc="Packages and classes for the SILE typesetter"
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/Omikhleia/omikhleia-sile-packages"
license=('MIT')
depends=('sile')
makedepends=('git')
source=("${_appname}::git+https://github.com/Omikhleia/${_appname}")
sha1sums=('SKIP')

pkgver() {
cd "${srcdir}/${_appname}"
git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
echo "build ..."
}

package() {
mkdir -p "${pkgdir}/usr/share/sile/"
mkdir -p "${pkgdir}/usr/share/sile/"

cd "${srcdir}/${_appname}"
cp -R classes "${pkgdir}/usr/share/sile/"
cp -R packages "${pkgdir}/usr/share/sile/"
cp -R docs "${pkgdir}/usr/share/sile/"
cp -R examples "${pkgdir}/usr/share/sile/"
}
