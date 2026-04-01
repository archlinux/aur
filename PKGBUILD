# shellcheck disable=SC2034,SC2086,SC2128,SC2148,SC2154,SC2164
# Maintainer: Toria <ninetailedtori@uwu.gal>
# Maintainer: Amirreza Firoozi <firoozi128.af@gmail.com>
# Maintainer: Oleg Hahm <oleg+aur@riot-os.org>

_pkgname="wttr"
_rawpkgname="bash-script-wttr"
pkgname="${_pkgname}"
pkgver=1.55
pkgrel=1
pkgdesc="a simple script that checks the weather condition via http://wttr.in"
arch=('any')
url="https://github.com/cblte/${_rawpkgname}"
license=('MIT')
makedepends=('git')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
depends=('curl')
source=("https://github.com/cblte/${_rawpkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('307cb2b7955c46fd9e7d52b60f233f12dfd2c3c0140dae8bea7747fe4ae1df51')
sha384sums=('e5dd2fc11800e48354ca571448d4381b7f85fc6b1e3b25cae0f6c17f40329057d697d78d3e28e455a855a07d42e4aaa6')
sha512sums=('0bb8e8161eac7a10ac4f3a0fbdd5f0b86f01548aaa7d1d87e3e9714aa0176b2148ad129b3adbb8fbb39030c14da903a900af6402103dabd12152b5a5403a4860')
b2sums=('2d1f56ea66f4bff01d0bde45a58e457d1a753df897e49baa020449b1c2b2691198ccb799f86f58d9a746baf913b9111c6c4cadde3a157ca117e573aca43f6291')

package() {
    cd "${srcdir}/${_rawpkgname}-${pkgver}"

    mkdir -p "${pkgdir}/usr/bin/"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"

    install -Dm0755 "wttr" "${pkgdir}/usr/bin/wttr"
    install -Dm0644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
