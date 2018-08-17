# Maintainer: Caleb Maclennan <caleb@alerque.com>

_npmname=less-plugin-autoprefix
pkgname=nodejs-$_npmname
pkgver=2.0.0
pkgrel=1
pkgdesc="Uses autoprefixer to add prefixes to css after conversion from less"
arch=(any)
url='http://lesscss.org'
license=('Apache 2.0')
depends=('nodejs'
        'npm'
        'nodejs-less'
        'nodejs-autoprefixer')
source=("https://registry.npmjs.org/$_npmname/-/${_npmname}-${pkgver}.tgz")
sha256sums=('aa7edec73f63896fc4670d05d15d4344ba0e276479dec2672915a54cb5519e6f')
noextract=("${source[@]##*/}")

package() {
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p "${_npmdir}"
    cd "${_npmdir}"
    npm install --user root -g --prefix "${pkgdir}/usr" "${_npmname}@${pkgver}"
}
