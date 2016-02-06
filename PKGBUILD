# Maintainer: Binaymin Darshan Hcohen <bennydarshan@gmail.com>
# Submitter: Martin Wimpress <code@flexion.org>

pkgname=yuyo-gtk-theme-git
_pkgname=yuyo-gtk-theme
pkgver=100.8f75db1
pkgrel=3
pkgdesc="The Official Ubuntu MATE GTK theme (forked from Moka Project's Orchis GTK theme)"
arch=('any')
url="https://github.com/snwh/yuyo-gtk-theme"
license=('GPL3')
depends=('gtk-engine-murrine')
optdepends=("python: scripts to simplify the rendering process"
	"inkscape: edit theme assets")
makedepends=('git')
source=("${_pkgname}"::"git+https://github.com/Acidburn0zzz/yuyo-gtk-theme.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "${srcdir}/${_pkgname}"

	install -dm755 "${pkgdir}"/usr/share/themes/Yuyo
	install -dm755 "${pkgdir}"/usr/share/themes/Yuyo-Dark
	install -dm755 "${pkgdir}"/usr/share/"${_pkgname}"

    cp -dpr --no-preserve=ownership ./Yuyo "${pkgdir}"/usr/share/themes/
    cp -dpr --no-preserve=ownership ./Yuyo-Dark "${pkgdir}"/usr/share/themes/
    cp -dpr --no-preserve=ownership ./*.py "${pkgdir}"/usr/share/"${_pkgname}"
    cp -dpr --no-preserve=ownership ./src "${pkgdir}"/usr/share/"${_pkgname}"
}
