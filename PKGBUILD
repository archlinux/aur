# Maintainer: ML <contact@mlgpt.io>
pkgname=late-cli-bin
pkgver=1.2.4
pkgrel=1
pkgdesc="High performance coding agent that just works with local or cloud models. Minimal token usage, extreme performance."
arch=('x86_64')
url="https://github.com/mlhher/late-cli"
license=('custom:BUSL-1.1')
provides=('late-cli')
conflicts=('late-cli')
source=("late-${pkgver}-linux-amd64::${url}/releases/download/v${pkgver}/late-linux-amd64"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/mlhher/late-cli/v${pkgver}/LICENSE")
sha256sums=('24fc41c6d687d71606f743fa0ee7c13d51cddb7481f8127945fa9d31042f7ef9'
            'c3519c930331bd0f29217d8dc45189a607bde455d7aaae840069b05fe9cf8900')

package() {
  # Install the downloaded binary as 'late'
  install -Dm755 "late-${pkgver}-linux-amd64" "${pkgdir}/usr/bin/late"
  
  # Install the custom Business Source License
  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
