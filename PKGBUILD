pkgname=openmodelica-omlibraries
pkgver=1.19.0
pkgrel=1
pkgdesc="The Open Source Modelica Suite - A collection of Modelica libraries for use with OpenModelica."
arch=('x86_64')
url="https://openmodelica.org"
license=('OSMC-PL')
groups=(openmodelica)
_group=OpenModelica
_name=OMLibraries
_commit=0f47ccf67304b00f9ded87ab3209939ecb581770
depends=('openmodelica-omc')
makedepends=('git' 'python-requests' 'python-simplejson' 'python-joblib' 'perl-xml-xpath')
source=("git+https://github.com/${_group}/${_name}.git#commit=${_commit}")
sha1sums=('SKIP')

prepare() {
  cd "$srcdir/$_name"
  git checkout "${_commit}"
}

build() {
  cd "$srcdir/$_name"
  make
}

package() {
  cd "$srcdir/$_name/build"
  mkdir -p ${pkgdir}/usr/lib/omlibrary
  cp -r * ${pkgdir}/usr/lib/omlibrary
}

