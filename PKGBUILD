# Maintainer: Teoh Han Hui <teohhanhui@gmail.com>

_pkgname=avdump3
pkgname=avdump3-bin
pkgver=8293_stable
pkgrel=2
pkgdesc='AniDB video/audio codec identification utility (command line version)'
arch=('any')
url='https://wiki.anidb.net/Avdump3'
license=('MIT' 'unknown')
depends=('dotnet-runtime-6.0')
makedepends=('unzip')
provides=('avdump3')
conflicts=('avdump3')
options=('!strip')
source=("https://cdn.anidb.net/client/${_pkgname}/${_pkgname}_${pkgver}.zip"
        "${_pkgname}_LICENSE-MIT::https://raw.githubusercontent.com/DvdKhl/AVDump3/master/LICENSE"
        "${_pkgname}.sh")
noextract=("${_pkgname}_${pkgver}.zip")
sha256sums=('6689420d7073c57d9faf19764e2a92f53c84d3ea66be402fd75e5419e2f0b38f'
            '97cb91cadbde7356e309613e2ed99cffcaf323197285d089e94dc5b6adbb603c'
            '3e3ebf6e5bfc3a1253b4248c1737063287c87b27d1ac2a93f9673bf32bae2991')

prepare() {
    unzip -o "${_pkgname}_${pkgver}.zip" -d "${_pkgname}_${pkgver}"
}

package() {
    install -d "${pkgdir}/opt/${_pkgname}"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/licenses/${_pkgname}"

    install -m644 "${_pkgname}_${pkgver}"/* -t "${pkgdir}/opt/${_pkgname}"
    install -m755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
    install -m644 "${_pkgname}_LICENSE-MIT" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
}
