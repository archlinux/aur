# Maintainer:linlinger <linyx@stp.net.cn>

pkgbase=mint-translations-git
pkgname=mint-translations-git
_pkgname=mint-translations
pkgver=2021.06.25
pkgrel=1
pkgdesc="Translation file for Linux Mint applications"
arch=(x86_64)
url="https://github.com/linuxmint/mint-translations"
license=(GPL)
makedepends=(bash gettext)
source=("git+https://github.com/linuxmint/mint-translations.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/${_pkgname}"
  ./clean.sh
  make clean
  make 
}

package() {
	cp -rf "${srcdir}/${_pkgname}/usr" ${pkgdir}
}
