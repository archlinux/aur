# Maintainer: czyt <czytcn@gmail.com>
pkgname=ecaptureq-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="A cross-platform GUI for ecapture "
arch=('x86_64')
url="https://github.com/gojue/ecaptureQ"
license=('mit')
depends=('libayatana-appindicator' 'webkit2gtk-4.1' 'gtk3')
optdepends=(
    'ecapture: CLI eBPF-based TLS capture tool (conflicts with ecapture-bin)'
    'ecapture-bin: Prebuilt binary of ecapture (conflicts with ecapture)'
)
source=("eCaptureQ_${pkgver}_amd64.deb::https://github.com/gojue/ecaptureQ/releases/download/v${pkgver}/eCaptureQ_${pkgver}_amd64.deb")
md5sums=('70dca57edf0ecf164aa2db1df8d67b56')

package() {
    # Extract the deb package
    ar p "${srcdir}/eCaptureQ_${pkgver}_amd64.deb" data.tar.gz | tar xz -C "${pkgdir}"

    # Fix permissions
    chmod -R u=rwX,go=rX "${pkgdir}"
}
