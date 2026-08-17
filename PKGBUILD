# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=foldcomp-bin
_pkgname=foldcomp
_tag=v1.0.0
pkgver=1.0.0
pkgrel=1
pkgdesc="Compress and index protein structures with torsion angles"
arch=('x86_64')
url="https://github.com/steineggerlab/foldcomp"
license=('MIT')
depends=()
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
source=("${url}/releases/download/${_tag}/foldcomp-linux-x86_64.tar.gz"
        "LICENSE.txt::https://raw.githubusercontent.com/steineggerlab/foldcomp/${_tag}/LICENSE.txt")
sha256sums=('2ef00e512a5ee354f1e4e911cd1375482aabfa3afff01cfe8afa705414ed74ff'
            '493e3708ecf691a99bda8eec772ac11a12c1abf39def5f4e0297bd1f82039de3')

# Upstream ships a statically-linked raw binary (ldd: not a dynamic
# executable). The tarball omits the license, so it is fetched from the
# tagged source instead.

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
