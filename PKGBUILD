# Maintainer: Guru <anjanaya@gmail.com>
pkgname=agent-browser
pkgver=0.4.4
pkgrel=1
pkgdesc="Headless browser automation CLI for AI agents"
arch=('any')
url="https://github.com/vercel-labs/agent-browser"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('52d9865d0e624933dd6a4c50c49477ad0ed0cfd88de776f4a4272f16fe030e2d')

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

    # Clean npm metadata from node_modules
    find "${pkgdir}/usr/lib/node_modules" -name 'package.json' -exec \
        sed -i '/_where/d; /_resolved/d; /_integrity/d; /_from/d' {} \;
}
