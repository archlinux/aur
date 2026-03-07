_gitname="pdf-parser"
pkgname="${_gitname}-git"
pkgver=0.7.13_0kali1_0_g1a402e8
pkgrel=1
pkgdesc="pdf-parser, use it to parse a PDF document"
arch=("any")
url="https://gitlab.com/kalilinux/packages/pdf-parser.git/"
license=("GPL-2+")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=("python>=2.5.1" "zlib>=1.3.2-2" "python-pyzipper>=0.3.6-1")
makedepends=("git")
source=("git+${url}")
sha256sums=('SKIP')

pkgver(){
  cd "${_gitname}"
  git describe --tags --long | cut -d / -f2 | tr '-' '_'
}

package() {
  cd "${_gitname}"
  install -Dm0755 pdf-parser.py "$pkgdir/usr/bin/pdf-parser"
}

