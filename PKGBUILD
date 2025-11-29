# Maintainer: sineptic <sineptic0@gmail.com>
pkgname=sse-bin
pkgver=15.0.8_1
pkgrel=1
pkgdesc="Paranoia Secret Space Encryptor File and Text desktop utilities from Paranoiaworks"
arch=('x86_64')
url="https://paranoiaworks.mobi"
license=('custom')
source=(
    "$url/download/files/pfte_${pkgver//_/-}_amd64.deb"
    "license.txt"
)
sha256sums=(
    '31b3fae30d3e26804f5ed77bbd66920e824042a239c94720023dded78c571e3c'
    'f23431d1e94d187fe3e0254b8a530a875d8615bbe451e9d3f564627835e7d527'
)

options=('!strip')

package() {
    bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}"
    echo "Installing license and desktop file..."
    install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
    install -Dm644 "${pkgdir}/opt/pfte/lib/pfte-Paranoia_File_and_Text_Encryption.desktop" "${pkgdir}/usr/share/applications/pfte-Paranoia_File_and_Text_Encryption.desktop"
}
