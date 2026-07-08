# Maintainer: Yiğit Salar <yigit (dot) salar7 (at) gmail (dot) com>
pkgname=mpf-check
_pkgname=MPF.Check
pkgdesc="Media Preservation Frontend for Aaru and Redumper in C# (MPF.Check only - Rolling Release)"
pkgver=r3013.afd616d
pkgrel=1
url="https://github.com/SabreTools/MPF"
license=('MIT')
arch=('x86_64')
options=('!strip' '!debug')
provides=('mpf-check')
conflicts=('mpf-check')

source=("${url}/releases/download/rolling/${_pkgname}_net10.0_linux-x64_release.zip"
'https://raw.githubusercontent.com/SabreTools/MPF/master/README.md'
'https://raw.githubusercontent.com/SabreTools/MPF/master/LICENSE')
sha256sums=('SKIP'
'SKIP'
'SKIP')

package() {
    # Install MPF.Check
    install -Dm755 ${srcdir}/${_pkgname} \
        ${pkgdir}/usr/bin/${_pkgname}

    # Install documentation
    install -Dm644 ${srcdir}/README.md \
        ${pkgdir}/usr/local/share/doc/${_pkgname}/README.md

    # Install license
    install -Dm644 ${srcdir}/LICENSE \
        ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
}
