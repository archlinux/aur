# Maintainer : Immae <ismael.bouya@normalesup.org>

pkgname=mediagoblin-plugin-basicsearch
pkgver=0.2.0.r14.gba0a154
pkgrel=1
pkgdesc='This plugin adds support for displaying media in GNU MediaGoblin based on simple search queries.'
arch=('i686' 'x86_64')
url='https://github.com/ayleph/mediagoblin-basicsearch'
license=('AGPL')
depends=('mediagoblin')
install=plugin.install
makedepends=('git')
source=('basicsearch::git+https://github.com/ayleph/mediagoblin-basicsearch.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/basicsearch"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/basicsearch"

  install -dm755 "$pkgdir"/usr/share/webapps/mediagoblin/mediagoblin/plugins/
  cp -a basicsearch "$pkgdir"/usr/share/webapps/mediagoblin/mediagoblin/plugins/
}
