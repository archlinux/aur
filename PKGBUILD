# Maintainer: holouden <holouden @t tutanota d.o.t. com>

pkgname=ttf-hack-ligatured
_pkgname=hack-ligatured
pkgver=v3.003+FC3.1+JBMv1.0.5
pkgrel=1
pkgdesc='Hack patched with FIRA Code and JetBrains Mono ligatures by gaplo917'
arch=('any')
url='https://github.com/gaplo917/Ligatured-Hack'
license=('GPL3')
depends=('fontconfig')
provides=('ttf-hack')
source=("https://github.com/gaplo917/Ligatured-Hack/releases/download/${pkgver}/HackLigatured-${pkgver}.zip"
        "${pkgver}-LICENSE::https://raw.githubusercontent.com/gaplo917/Ligatured-Hack/master/LICENSE")
sha256sums=('34aeec7fa2a269e8fc1b82ac31dbd6e0f23a7e9279cf726e0d54b0acd36ea0bb'
            '8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903')

package() {
	mkdir -p ${pkgdir}/usr/share/fonts/TTF/${_pkgname}
    install -m644 ${srcdir}/*.ttf ${pkgdir}/usr/share/fonts/TTF/${_pkgname}
	install -Dm644 ./${pkgver}-LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/${pkgver}-LICENSE
}
