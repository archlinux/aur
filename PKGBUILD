# Maintainer: Michael Serajnik <m at mser dot at>
pkgname=filemaid-git
_pkgname=filemaid
pkgver=r4.45edb3b
pkgrel=1
pkgdesc="Rule-based file- and folder-organization tool inspired by Belvedere and similar programs such as Hazel and DropIt"
arch=("any")
url="https://github.com/cryzed/${_pkgname}"
license=("MIT")
depends=("python" "python-magic" "python-pyaml")
makedepends=("git")
source=("git+https://github.com/cryzed/${_pkgname}.git")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm755 "$srcdir/$_pkgname/filemaid.py" "$pkgdir/usr/bin/filemaid"
}
