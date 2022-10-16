# Maintainer: Riya Bisht <echo "aGFja2luZmluaXR5MTAwMUBnbWFpbC5jb20K" | base64 -d>
# Maintainer: Snehit Sah <echo "aGlAc25laGl0LmRldgo=" | base64 -d>

_pkgname=tgfs
pkgname="${_pkgname}-git"
pkgver=4c8562b
pkgrel=1
pkgdesc="A simple file tagger and manager"
arch=("any")
url="https://github.com/tg-fs/tgfs"
license=("GPL")
depends=("python" "sqlite")
provides=("tgfs")
source=("${_pkgname}::git+${url}.git")
sha256sums=("SKIP")

pkgver() {
  git -C "${_pkgname}" rev-parse --short HEAD
}

package() {
  mkdir -p "${pkgdir}/usr/bin/"
  cp "${_pkgname}/tgfs.py" "${pkgdir}/usr/bin/tgfs"
  chmod +x "${pkgdir}/usr/bin/tgfs"
}
