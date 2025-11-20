# Maintainer: kmille < aur at androidloves DOTTT me >

_pkgname=noscribe
pkgname="${_pkgname}-cpu-bin"
pkgver=0.6.2
pkgrel=1
pkgdesc="cutting edge AI technology for automated audio transcription"
arch=("x86_64")
url="https://github.com/kaixxx/noScribe"
license=("GPL-3.0-only")
provides=("${_pkgname}")
conflicts=("${_pkgname}-cuda-bin")

# https://github.com/kaixxx/noScribe/blob/main/README.md#linux
source=("noScribe_0.6.2c_legacy_cpu_linux_amd64.tar.gz::https://drive.switch.ch/index.php/s/HtKDKYRZRNaYBeI/download?path=%2FLinux&files=noScribe_0.6.2c_legacy_cpu_linux_amd64.tar.gz"
        "noScribe.desktop")
sha256sums=("d100f51984fef6b300a6f5e49fac6c4666d06490469535b601ef0ff0c6feb4f5"
            "b7a503311a68dce0b15266602b57e5f6f5dc5593919023198f48fe102b9bde57")

package() {
    mkdir -p "$pkgdir/opt/noScribe"
    cp -r "${srcdir}/noScribe/" "$pkgdir/opt/"

    install -d "$pkgdir/usr/bin"
    ln -s "/opt/noScribe/noScribe" "$pkgdir/usr/bin/$_pkgname"

    install -Dm 0644 noScribe.desktop "$pkgdir/usr/share/applications/noScribe.desktop"
}

