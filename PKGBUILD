# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Jose M. Garcia <josemaria.alkala at gmail dot com>
_pkgname='mchfuse'
pkgname="${_pkgname}-bin"
pkgver="0.3.2"
pkgrel=1
epoch=0
pkgdesc="Western Digital My Cloud Home FUSE file system"
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h' 'armv5h')
url="https://github.com/mnencia/mchfuse"
license=('Apache License 2.0')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=()
backup=()
options=()
install=
changelog=
source_x86_64=("https://github.com/mnencia/${_pkgname}/releases/download/v${pkgver}/mchfuse_${pkgver}_Linux_x86_64.tar.gz" "mchfuse.conf")
source_aarch64=("https://github.com/mnencia/${_pkgname}/releases/download/v${pkgver}/mchfuse_${pkgver}_Linux_arm64.tar.gz" "mchfuse.conf")
source_armv7h=("https://github.com/mnencia/${_pkgname}/releases/download/v${pkgver}/mchfuse_${pkgver}_Linux_armv7.tar.gz" "mchfuse.conf")
source_armv6h=("https://github.com/mnencia/${_pkgname}/releases/download/v${pkgver}/mchfuse_${pkgver}_Linux_armv6.tar.gz" "mchfuse.conf")
source_armv5h=("https://github.com/mnencia/${_pkgname}/releases/download/v${pkgver}/mchfuse_${pkgver}_Linux_armv5.tar.gz" "mchfuse.conf")

noextract=()
md5sums_x86_64=('c8f1e8803c67745038ec34d698899963'
                'fa672977e621324c4dd65fb9d2506c20')
md5sums_aarch64=('7a91fa13fc780f0de59b450036f6cc85'
                 'fa672977e621324c4dd65fb9d2506c20')
md5sums_armv7h=('12ca1e0256538438930b7d3de6f7ded4'
                'fa672977e621324c4dd65fb9d2506c20')
md5sums_armv6h=('de44344cadbaf4eeb513f8ec35e92249'
                'fa672977e621324c4dd65fb9d2506c20')
md5sums_armv5h=('7e4fabd6ffcfee5a09adb468b5738b5c'
                'fa672977e621324c4dd65fb9d2506c20')
validpgpkeys=()
backup=('etc/mchfuse.conf' 
)

package() {
    tar -xf ${_pkgname}_${pkgver}_Linux_x86_64.tar.gz
    install -Dm 655 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm 600 "${_pkgname}.conf" "${pkgdir}/etc/mchfuse/${_pkgname}.conf"
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname-bin}/LICENSE
    install -dm777 "${pkgdir}/mnt/mch"
    echo "Edit /etc/mchfuse.conf with your username and password"
    echo "Edit /etc/fstab as per documentation"
}
