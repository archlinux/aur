# Maintainer: Leonardo Santana Vieira <leosanvieira at gmail dot com>

_pkgname=archnews
pkgname=${_pkgname}-git
pkgver=3.73eb11d
pkgrel=2
pkgdesc="Read latest Arch Linux News RSS from your CLI"
arch=("any")
url="https://github.com/leosanvieira/archnews"
license=("GPL3")
depends=("python" "python-beautifulsoup4" "python-html5lib" "python-colorama" "python-feedparser")
source=("git+https://github.com/leosanvieira/archnews.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 "${_pkgname}.py" "${pkgdir}/usr/bin/${_pkgname}"
}
