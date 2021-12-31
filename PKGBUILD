# Maintainer: jdn06 <jdn06.jdn06@outlook.fr>

pkgname=pyromaths-git
_pkgname=pyromaths
pkgver=21.8.2.r89.gecb2a1c
pkgrel=1
pkgdesc="French program to create mathematical exercises and models"
arch=(any)
license=('GPL3')
depends=('python-lxml' 'texlive-pstricks' 'texlive-latexextra' 'texlive-fontsextra' 'texlive-pictures')
makedepends=('python-setuptools' 'git')
optdepends=()

provides=(pyromaths)
conflicts=(pyromaths)

source=("$_pkgname"::"git+https://framagit.org/$_pkgname/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
        cd "$_pkgname"
	git describe --long --tags | sed 's/version-//' | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$_pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}

