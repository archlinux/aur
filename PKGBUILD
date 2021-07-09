# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=ativayeban
pkgname=${_pkgname}-git
pkgver=r7.b85db68
pkgrel=1
pkgdesc="Fall through a labyrinth. Avoid getting crushed!"
arch=('any')
url="https://github.com/Nebuleon/ativayeban"
license=('GPL2')
makedepends=('git')
depends=('sdl' 'sdl_image')
source=("git+https://github.com/Nebuleon/ativayeban.git")
sha1sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  install -Dm644 "${srcdir}/${_pkgname}/COPYRIGHT" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install "${srcdir}/${_pkgname}/${_pkgname}" -Dm755 "${pkgdir}/opt/${_pkgname}/${_pkgname}"
  install "${srcdir}/${_pkgname}/penguin_ball.png" -Dm644 "${pkgdir}/opt/${_pkgname}/penguin_ball.png"
  install "${startdir}/${_pkgname}.sh" -Dm755 "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}/data/default.gcw0.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
