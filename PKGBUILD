# Maintainer: Nicholas Schlabach <Techcable at techcable dot net>
pkgname=zls-bin
pkgver="0.10.0"
pkgrel=1
pkgdesc="Zig Language Server, or zls, is a language server for Zig. Pre-compiled official binary."
arch=('x86_64')
url="https://github.com/zigtools/zls"
license=('MIT')
depends=('zig')
provides=('zls')
conflicts=('zls' 'zls-git')
replaces=('zls' 'zls-git')
# Gives a friendly recomendation to run `zls config`
install="zls.install"
# The MIT is considered a "custom" license, because it has a unique copyright line
#
# See the wiki for more info: https://wiki.archlinux.org/title/PKGBUILD#license
source=("zls-LICENSE.txt::https://raw.githubusercontent.com/zigtools/zls/0.10.0/LICENSE")
noextract=("zls-LICENSE.txt")
# This is the actual binary (everything except the license)
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/zigtools/zls/releases/download/${pkgver}/${CARCH}-linux.tar.zst")
sha256sums=('39d99dfbe269e3daf483652bd925f4955e3b2a3d11fd737b538d366ef358c3ce')
sha256sums_x86_64=('3c25891dd39e0073ef0ef3117aba724a63264de85583bceccea7718577a61acf')

package() {
    _output="${srcdir}"
    install -Dm755 "${_output}/bin/zls" "${pkgdir}/usr/bin/zls"


    install -Dm644 "${_output}/README.md" "${pkgdir}/usr/share/zls/README.md"
    # Install license file
    install -Dm644 "${_output}/zls-LICENSE.txt" "${pkgdir}/usr/share/licenses/zls-bin/LICENSE"
}
