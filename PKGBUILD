# Maintainer: Christopher Loen <christopherloen at gmail dot com>
pkgname=hkg2arch
pkgver=0.5
pkgrel=1
pkgdesc='A simple script to generate PKGBUILDs of haskell packages'
arch=('any')
url='https://github.com/christopherloen/hkg2arch'
license=('MIT')
depends=('wget' 'ghc' 'cabal-install')
source=("git://github.com/christopherloen/hkg2arch.git")
sha256sums=('SKIP')

package() {
	cd "${srcdir}/${pkgname}" && chmod +x "${pkgname}"
	install -dm755 "${pkgdir}/usr/bin/"
        cp "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
        install -dm644 "${pkgdir}/usr/share/licenses/${pkgname}/"
        cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
        install -dm755 "${pkgdir}/usr/share/${pkgname}/"
        cp deps.txt "${pkgdir}/usr/share/${pkgname}/"
}
