# Maintainer:   Maximilian Weiss <$(echo "bWF4QG1heHdlaXNzLmlv" | base64 -d)>
# Contributor:  Phil Estes <https://estesp.dev/#contact>

pkgname=manifest-tool-bin
pkgver=2.1.6
pkgrel=1

pkgdesc='Container image manifest tool for manifest list object creation/query'
arch=('x86_64')
url='https://github.com/estesp/manifest-tool'
license=('Apache2')
depends=()
provides=('manifest-tool' 'manifest-tool-bin')
conflicts=('manifest-tool' 'manifest-tool-git' 'manifest-tool-bin')
source=("https://github.com/estesp/manifest-tool/releases/download/v${pkgver}/binaries-manifest-tool-${pkgver}.tar.gz")
sha256sums=('585b1e9a78912d99590cf769cfa9b42348a920453d06f37b42f07078c0abc0ad')

build () {
    tar -xzf "${srcdir}/binaries-manifest-tool-${pkgver}.tar.gz" -C "${srcdir}/"
}

package() {
    install -Dm755 "$srcdir/manifest-tool-linux-amd64" "$pkgdir/usr/bin/manifest-tool"
}
