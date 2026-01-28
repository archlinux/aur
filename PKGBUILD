# Maintainer: Guru <anjanaya@gmail.com>
pkgname=agent-browser
pkgver=0.8.4
pkgrel=1
pkgdesc="Headless browser automation CLI for AI agents"
arch=('any')
url="https://github.com/vercel-labs/agent-browser"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('56e6eef4b43d661de225a0e23bdae740bc96cd0783f9c8952efa01dbeaa47cbc')

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

    # Clean npm metadata from node_modules
    find "${pkgdir}/usr/lib/node_modules" -name 'package.json' -exec \
        sed -i '/_where/d; /_resolved/d; /_integrity/d; /_from/d' {} \;
}
