# Maintainer:   Maximilian Weiss <$(echo "bWF4QG1heHdlaXNzLmlv" | base64 -d)>
# Contributor:  Phil Estes <https://estesp.dev/#contact>

pkgname=manifest-tool-bin
pkgver=2.2.2
pkgrel=1

pkgdesc='Container image manifest tool for manifest list object creation/query'
arch=('x86_64')
url='https://github.com/estesp/manifest-tool'
license=('Apache2')
depends=()
provides=('manifest-tool' 'manifest-tool-bin')
conflicts=('manifest-tool' 'manifest-tool-git' 'manifest-tool-bin')
source=("https://github.com/estesp/manifest-tool/releases/download/v${pkgver}/binaries-manifest-tool-${pkgver}.tar.gz")
sha256sums=('bdca525326694849594ab3ba63638fdb664690c9384df947bd3cff943d14736b')

build () {
    tar -xzf "${srcdir}/binaries-manifest-tool-${pkgver}.tar.gz" -C "${srcdir}/"
}

package() {
    install -Dm755 "$srcdir/manifest-tool-linux-amd64" "$pkgdir/usr/bin/manifest-tool"
}
