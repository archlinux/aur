# Maintainer: novica <nnovica@gmail.com>

pkgname=ggsql-bin
pkgver=0.4.1 # renovate: datasource=github-releases depName=posit-dev/ggsql
pkgrel=1
pkgdesc="SQL extension for declarative data visualization"
arch=('x86_64' 'aarch64')
url="https://github.com/posit-dev/ggsql"
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++' 'hicolor-icon-theme')
conflicts=('ggsql')
options=('!debug')
provides=("ggsql=${pkgver}")

source_x86_64=("${pkgname}-${pkgver}_amd64.deb::https://github.com/posit-dev/ggsql/releases/download/v${pkgver}/ggsql_${pkgver}_amd64.deb"
               "LICENSE::https://raw.githubusercontent.com/posit-dev/ggsql/refs/tags/v${pkgver}/LICENSE.md")
source_aarch64=("${pkgname}-${pkgver}_arm64.deb::https://github.com/posit-dev/ggsql/releases/download/v${pkgver}/ggsql_${pkgver}_arm64.deb"
                "LICENSE::https://raw.githubusercontent.com/posit-dev/ggsql/refs/tags/v${pkgver}/LICENSE.md")

sha256sums_x86_64=('da3bb776b4806e0629f475695ebe6fe32fe5e8ca8336857a09408a972585b069'
                   'c4faf3235a2b77ac03e7c050c640b36a1873b7889d96cbe2951bf75fa4f8bd9d')
sha256sums_aarch64=('aec0c1a4cbbf13f9effbfbe81fdd39d76db2a47b31a35022c4b06a19f142d472'
                    'c4faf3235a2b77ac03e7c050c640b36a1873b7889d96cbe2951bf75fa4f8bd9d')

package() {
    cd "${srcdir}"
    bsdtar -xf ./*.deb
    bsdtar -xf data.tar.gz -C "${pkgdir}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
