# Maintainer: Michael Serajnik <m at mser dot at>
pkgname=patool-git
_pkgname=patool
pkgver=1.12.r41.g723006a
pkgrel=1
pkgdesc="Portable command line archive file manager"
arch=("any")
url="https://github.com/wummel/${_pkgname}"
license=("GPL3")
depends=("python")
makedepends=("git" "python-setuptools")
optdepends=("tar: extracting TAR files"
            "unrar: extracting RAR files"
            "p7zip: extracting ZIP and 7z files")
provides=("patool")
conflicts=("patool")
source=("git+https://github.com/wummel/${_pkgname}.git")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/upstream\///;s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
}
