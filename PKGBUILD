# Maintainer: Lukas Zimmermann <luk.zim91 at gmail dot com>

pkgname=nodejs-storybook-cli
_pkgname=@storybook/cli
pkgver=6.3.10
pkgrel=1
pkgdesc="Storybook's CLI - easiest method of adding storybook to your projects"
arch=(any)
url="https://github.com/storybooks/storybook/tree/master/lib/cli"
license=(MIT)
depends=('nodejs' 'npm')
source=("https://registry.npmjs.org/${_pkgname}/-/cli-${pkgver}.tgz")
noextract=(cli-$pkgver.tgz)
sha256sums=('0230c636fc787385b8fe0e75c45db3ae84d3a6ec4bbfb1afde9703103dfac280')

package() {
  cd "${srcdir}"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "${_npmdir}"
  cd "${_npmdir}"
  npm install -g --prefix "${pkgdir}/usr" "${_pkgname}@${pkgver}"
  chown -R root:root "${pkgdir}"
}

# vim:set ts=2 sw=2 et:

