# Maintainer: robertfoster
pkgname=shimmy-bin
pkgver=1.8.2 # renovate: datasource=github-releases depName=Michael-A-Kuykendall/shimmy
pkgrel=1
pkgdesc="Lightweight 5MB Ollama alternative with native SafeTensors support. No Python dependencies, 2x faster loading."
arch=('x86_64' 'aarch64')
url="https://github.com/Michael-A-Kuykendall/shimmy"
license=('MIT')
depends=('gcc-libs')
provides=('shimmy')
conflicts=('shimmy' 'shimmy-git')

package() {
  if [ "$CARCH" = "x86_64" ]; then
    install -Dm755 "${srcdir}/shimmy-x86_64-${pkgver}" "${pkgdir}/usr/bin/shimmy"
  else
    install -Dm755 "${srcdir}/shimmy-${pkgver}" "${pkgdir}/usr/bin/shimmy"
  fi

  # Install the license
  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

source_x86_64=("shimmy-x86_64-${pkgver}::https://github.com/Michael-A-Kuykendall/shimmy/releases/download/v${pkgver}/shimmy-linux-x86_64"
  "LICENSE::https://raw.githubusercontent.com/Michael-A-Kuykendall/shimmy/v${pkgver}/LICENSE")
source_aarch64=("shimmy-${pkgver}::https://github.com/Michael-A-Kuykendall/shimmy/releases/download/v${pkgver}/shimmy"
  "LICENSE::https://raw.githubusercontent.com/Michael-A-Kuykendall/shimmy/v${pkgver}/LICENSE")
sha256sums_x86_64=('083c2185907d57c790c4f108afb313ec52e5175b7f2665acbd8745bcaaccef86'
                   'ebee25b6399a49518bfb24ab186d3b15a34145fd7b11205d26f25a0a4c5db013')
sha256sums_aarch64=('083c2185907d57c790c4f108afb313ec52e5175b7f2665acbd8745bcaaccef86'
                    'ebee25b6399a49518bfb24ab186d3b15a34145fd7b11205d26f25a0a4c5db013')
