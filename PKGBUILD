# Maintainer: Patrick M. <aur at patrickmang dot de>

pkgname=ttf-gofont-git
pkgver=r328.70e8d0d
pkgrel=1
pkgdesc="The font for the experimental Go user interface toolkit"
arch=('any')
url="https://go.dev/blog/go-fonts"
license=('custom')
source=("git+https://go.googlesource.com/image")
sha512sums=('SKIP')

pkgver() {
  cd "image"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/image"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "font/gofont/ttfs"
  install -Ddm755 "${pkgdir}/usr/share/fonts/Go"
  install -Dm644 "Go-Bold-Italic.ttf"		"${pkgdir}/usr/share/fonts/Go/"
  install -Dm644 "Go-Bold.ttf"			"${pkgdir}/usr/share/fonts/Go/"
  install -Dm644 "Go-Italic.ttf"		"${pkgdir}/usr/share/fonts/Go/"
  install -Dm644 "Go-Medium-Italic.ttf"		"${pkgdir}/usr/share/fonts/Go/"
  install -Dm644 "Go-Medium.ttf"		"${pkgdir}/usr/share/fonts/Go/"
  install -Dm644 "Go-Mono-Bold-Italic.ttf"	"${pkgdir}/usr/share/fonts/Go/"
  install -Dm644 "Go-Mono-Bold.ttf"		"${pkgdir}/usr/share/fonts/Go/"
  install -Dm644 "Go-Mono-Italic.ttf"		"${pkgdir}/usr/share/fonts/Go/"
  install -Dm644 "Go-Mono.ttf"			"${pkgdir}/usr/share/fonts/Go/"
  install -Dm644 "Go-Regular.ttf"		"${pkgdir}/usr/share/fonts/Go/"
  install -Dm644 "Go-Smallcaps-Italic.ttf"	"${pkgdir}/usr/share/fonts/Go/"
  install -Dm644 "Go-Smallcaps.ttf"		"${pkgdir}/usr/share/fonts/Go/"
}
