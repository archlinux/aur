# Maintainer: sohlk <sohlk at outlook dot com>

pkgname=eleventy-plugin-syntaxhighlight
pkgver=5.0.0
pkgrel=1
pkgdesc="A pack of Eleventy plugins for syntax highlighting in Markdown, Liquid, and Nunjucks templates"
arch=('any')
url='https://github.com/11ty/eleventy-plugin-syntaxhighlight'
license=('MIT')
depends=('nodejs' 'eleventy')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/11ty/eleventy-plugin-syntaxhighlight/archive/v${pkgver}.tar.gz")
noextract=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
  npm install -g --production --legacy-peer-deps --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tar.gz"
  chown -R root:root "${pkgdir}"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgdir}/usr/lib/node_modules/@11ty/eleventy-plugin-syntaxhighlight/LICENSE"
}
