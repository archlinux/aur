# Contributor: Martial Toniotti <martial@toniotti.be>
# Maintainer: tee < teeaur at duck dot com >

pkgname=standardfile-bin
pkgver=0.13.3
pkgrel=1
pkgdesc='Standard File Server for standardnotes, Go Implementation'
url='https://github.com/mdouchement/standardfile'
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('glibc')
backup=('etc/standardfile.yaml')
source_x86_64=("$pkgname-$pkgver-$arch::$url/releases/download/v${pkgver}/standardfile-linux-amd64")
source_aarch64=("$pkgname-$pkgver-arm64::$url/releases/download/v${pkgver}/standardfile-linux-arm64")
sha256sums=('6ec3ff769f3c9775443009d76da5fca010ee94f1e71f474af6be5a33b9a8e70c'
            'a5e8669b915dc6553f0af9137840adfabb020f391846d9f3ab3dbe3175d320fa'
            '2014138283a50581136b85a4d4964ee70821cb0ed965fa5acc1c3d7611855288'
            '1010525aa4b320cb0ccf7b5411ca5879892c34711f1505f26be3f16214ead07c'
            '1010525aa4b320cb0ccf7b5411ca5879892c34711f1505f26be3f16214ead07c')
sha256sums_x86_64=('eee94a6ee9c2e5947aaa89945949ea9b7dbea0bae0a7d7217eb99ad68a26f83f')
sha256sums_aarch64=('33763f7c52fed8eba06b66e7e71fa99baffb2a3a84a5e4a60407fe6524ad60e1')
source=(standardfile.service
        standardfile.sysusers
        standardfile.tmpfiles
        standardfile.example.yaml
        standardfile.yaml)

package() {
  install -Dm 755 "${srcdir}/$pkgname-$pkgver-$arch"          "${pkgdir}/usr/bin/standardfile"
  install -Dm 644 "${srcdir}/standardfile.service"  "${pkgdir}/usr/lib/systemd/system/standardfile.service"
  install -Dm 644 "${srcdir}/standardfile.sysusers" "${pkgdir}/usr/lib/sysusers.d/standardfile.conf"
  install -Dm 644 "${srcdir}/standardfile.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/standarfile.conf"
  install -Dm 644 "${srcdir}/standardfile.example.yaml"      "${pkgdir}/etc/standardfile.example.yaml"
}
