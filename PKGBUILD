# Maintainer: Andy Kelk <andy@andykelk.net>
pkgname=xonora-cli-bin
pkgver=0.3.10
pkgrel=1
pkgdesc="Native C++ terminal UI client for Music Assistant"
arch=('x86_64' 'aarch64')
url="https://github.com/hayupadhyaya/xonora-cli"
license=('LicenseRef-custom')
provides=('xonora-cli')
conflicts=('xonora-cli')

source_x86_64=("https://github.com/hayupadhyaya/xonora-cli/releases/download/cli-v${pkgver}/xonora-cli-v${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/hayupadhyaya/xonora-cli/releases/download/cli-v${pkgver}/xonora-cli-v${pkgver}-linux-arm64.tar.gz")

sha256sums_x86_64=('d69b83c3c1e448204115ad5c6dd013d4ecf49b750bc2234de5473740bf323678')
sha256sums_aarch64=('bf52f70e279f5075db17f74c06e9e451836f9c4baa0917e3f82fe6435821ca46')

package() {
    if [ "${CARCH}" = "x86_64" ]; then
        _dir="xonora-cli-v${pkgver}-linux-x86_64"
    elif [ "${CARCH}" = "aarch64" ]; then
        _dir="xonora-cli-v${pkgver}-linux-arm64"
    fi

    install -Dm755 "${_dir}/xonora-cli" "${pkgdir}/usr/bin/xonora-cli"
    install -Dm644 "${_dir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
