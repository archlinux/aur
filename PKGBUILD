# Maintainer: robertfoster
pkgname=shimmy-bin
pkgver=1.9.0 # renovate: datasource=github-releases depName=Michael-A-Kuykendall/shimmy
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
sha256sums_x86_64=('111ed7b852cdb928304d36190b1867ea43d837b94c70af31f4fd2d861098b654'
                   '13407a4bf45d95fb4c3db4e62d85e0d400a0891113172942ae436ed9b3e9ae85')
sha256sums_aarch64=('111ed7b852cdb928304d36190b1867ea43d837b94c70af31f4fd2d861098b654'
                    '13407a4bf45d95fb4c3db4e62d85e0d400a0891113172942ae436ed9b3e9ae85')
