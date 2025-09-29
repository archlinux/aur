# Maintainer: Rubin Simons <me@rubin55.org>

_pkgname='dev-proxy'
pkgname="${_pkgname}-bin"
pkgver=1.2.0
pkgrel=1
pkgdesc="Simulate API failures, throttling, and chaos — all from your command line."
arch=('x86_64')
url="https://github.com/dotnet/dev-proxy"
license=('MIT')
provides=(${_pkgname})
options=('!strip')
makedepends=('unzip')
source=(
    ${url}/releases/download/v${pkgver}/${_pkgname}-linux-x64-v${pkgver}.zip
    "devproxy.sh"
)
sha256sums=('707ce2db113f3b224ee88f6b2ef144378bf29a683c8437262ac82f6f15459e06'
            '747efdfc44ba8484d945e8b996543a44d9f44ac8546e8281d432a1ab105e1db5')

package() {
    mkdir -p "${pkgdir}/opt" "${pkgdir}/usr/bin"
    unzip "${srcdir}/dev-proxy-linux-x64-v1.2.0.zip" -d "${pkgdir}/opt/${_pkgname}"
    chmod +x "${pkgdir}/opt/${_pkgname}/devproxy" "${pkgdir}/opt/${_pkgname}"/*.sh
    install -Dm755 "$srcdir/devproxy.sh" "$pkgdir/usr/bin/devproxy"
}
