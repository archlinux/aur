# Maintainer: Topik topik@topik.tech
pkgname=icu67-bin
pkgver=67.1
pkgrel=1
pkgdesc="International Components for Unicode library (binary release)"
arch=('x86_64')
url="https://github.com/unicode-org/icu"
license=('custom:icu')
depends=('bash')
source=("https://github.com/topik0/icu-binaries/releases/download/v67/icu67-67.1-1-x86_64.pkg.tar.zst")
sha512sums=('e20ff5731be37ebc1bd8a78788e171f9df6f1dee1cc3b454d28d24bbd23c430c5b18663b3a3d21ff7d8b57c4939839fe9c4d4dd1b0bc7cb9f2bf9849f424dcba')

package() {
    tar xf icu67-67.1-1-x86_64.pkg.tar.zst
	mkdir -p "${pkgdir}"/usr/{share,lib}
	mkdir -p "${pkgdir}"/usr/share/licenses/icu67
    cp -r "${srcdir}"/usr/lib/* -t "${pkgdir}"/usr/lib/
	install -Dm644 "${srcdir}"/usr/share/licenses/icu67/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}