# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=emulationstation-autoscraper
pkgver=162.99358ba
pkgrel=1
pkgdesc="An auto-scraper for EmulationStation written in Go using hashes"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/sselph/scraper"
license=('custom')
makedepends=('git' 'go')

source=("https://raw.githubusercontent.com/sselph/scraper/master/LICENSE")
sha256sums=('SKIP')

build() {
  cd "${srcdir}"
  export GOPATH="${srcdir}"
  echo $(go get github.com/sselph/scraper)
  echo $(go build github.com/sselph/scraper)
}

package() {
  strip "${srcdir}/scraper"
  install -Dm755 "${srcdir}/scraper" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/src/github.com/sselph/scraper/LICENSE"		"${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  install -Dm644 "${srcdir}/src/github.com/nfnt/resize/LICENSE"			"${pkgdir}/usr/share/licenses/${pkgname}/license-resize.txt"
  install -Dm644 "${srcdir}/src/github.com/golang/snappy/LICENSE"		"${pkgdir}/usr/share/licenses/${pkgname}/license-snappy.txt"
  install -Dm644 "${srcdir}/src/github.com/syndtr/goleveldb/LICENSE"		"${pkgdir}/usr/share/licenses/${pkgname}/license-goleveldb.txt"
  install -Dm644 "${srcdir}/src/github.com/hashicorp/golang-lru/LICENSE"	"${pkgdir}/usr/share/licenses/${pkgname}/license-golang-lru.txt"
  install -Dm644 "${srcdir}/src/github.com/mitchellh/go-homedir/LICENSE"	"${pkgdir}/usr/share/licenses/${pkgname}/license-go-homedir.txt"
  install -Dm644 "${srcdir}/src/github.com/kr/fs/LICENSE"			"${pkgdir}/usr/share/licenses/${pkgname}/license-fs.txt"
}
