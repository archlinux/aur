# Maintainer: Martins Mozeikox <martins.mozeiko@gmail.com>

pkgname=standardfile-bin
pkgver=0.8.0
pkgrel=1
pkgdesc='Standard File Server, Go Implementation'
url='https://github.com/tectiv3/standardfile'
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('glibc')
backup=('etc/standardfile.yaml')
source_x86_64=("https://github.com/mdouchement/standardfile/releases/download/v${pkgver}/standardfile-linux-amd64")
source_aarch64=("https://github.com/tectiv3/standardfile/releases/download/v${pkgver}/standardfile_${pkgver}_linux_arm8.tar.gz")
sha256sums_x86_64=('1736d1a70ded75de9f9bcca2f479b5b4ee63ae6ddd0f25bcc0a2eecbfec9fe12')
sha256sums_aarch64=('972511c60986c5cf6564fd9c71849b752a36a277122dccca6f15e3aa40858cfc')
source=(standardfile.service
        standardfile.sysusers
        standardfile.tmpfiles
        standardfile.example.yaml
        standardfile.yaml)
sha256sums=('6ec3ff769f3c9775443009d76da5fca010ee94f1e71f474af6be5a33b9a8e70c'
            'a5e8669b915dc6553f0af9137840adfabb020f391846d9f3ab3dbe3175d320fa'
            '2014138283a50581136b85a4d4964ee70821cb0ed965fa5acc1c3d7611855288'
            '1010525aa4b320cb0ccf7b5411ca5879892c34711f1505f26be3f16214ead07c'
            '1010525aa4b320cb0ccf7b5411ca5879892c34711f1505f26be3f16214ead07c')

package() {
  install -Dm 755 "${srcdir}/standardfile-linux-amd64"          "${pkgdir}/usr/bin/standardfile"
  install -Dm 644 "${srcdir}/standardfile.service"  "${pkgdir}/usr/lib/systemd/system/standardfile.service"
  install -Dm 644 "${srcdir}/standardfile.sysusers" "${pkgdir}/usr/lib/sysusers.d/standardfile.conf"
  install -Dm 644 "${srcdir}/standardfile.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/standarfile.conf"
  install -Dm 644 "${srcdir}/standardfile.example.yaml"      "${pkgdir}/etc/standardfile.example.yaml"
}
