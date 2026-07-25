# Contributor: Martial Toniotti <martial@toniotti.be>
# Maintainer: tee < teeaur at duck dot com >

pkgname=standardfile-bin
pkgver=0.14.0
pkgrel=1
pkgdesc='Standard File Server for standardnotes, Go Implementation'
url='https://github.com/mdouchement/standardfile'
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('glibc')
backup=('etc/standardfile.yaml')
source_x86_64=("$pkgname-$pkgver-$arch::$url/releases/download/v$pkgver/standardfile-linux-amd64")
source_aarch64=("$pkgname-$pkgver-arm64::$url/releases/download/v$pkgver/standardfile-linux-arm64")
sha256sums=('6ec3ff769f3c9775443009d76da5fca010ee94f1e71f474af6be5a33b9a8e70c'
            'a5e8669b915dc6553f0af9137840adfabb020f391846d9f3ab3dbe3175d320fa'
            '2014138283a50581136b85a4d4964ee70821cb0ed965fa5acc1c3d7611855288'
            '1010525aa4b320cb0ccf7b5411ca5879892c34711f1505f26be3f16214ead07c'
            '1010525aa4b320cb0ccf7b5411ca5879892c34711f1505f26be3f16214ead07c')
sha256sums_x86_64=('f22d98c93ca13100627ea93b01b9ce4822b96175a0c966d3612116f91c7fe07d')
sha256sums_aarch64=('0273d1ee9cc4085834bd39de5d75c3120088fe93de2561bc16526755f8584b68')
source=(standardfile.service
        standardfile.sysusers
        standardfile.tmpfiles
        standardfile.example.yaml
        standardfile.yaml)

package() {
  install -Dm755 "$pkgname-$pkgver-$arch" "${pkgdir}/usr/bin/standardfile"
  install -Dm644 "standardfile.service"  "${pkgdir}/usr/lib/systemd/system/standardfile.service"
  install -Dm644 "standardfile.sysusers" "${pkgdir}/usr/lib/sysusers.d/standardfile.conf"
  install -Dm644 "standardfile.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/standarfile.conf"
  install -Dm644 "standardfile.example.yaml" "${pkgdir}/etc/standardfile.example.yaml"
}
