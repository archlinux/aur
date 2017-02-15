# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Frederik “Freso” S. Olesen <archlinux@freso.dk>
pkgname=picard-plugins-git
pkgver=1.3.r115.10f7471
_pkgver=1.3
pkgrel=1
pkgdesc="plugins from picard-plugins repository"
arch=('any')
url="https://picard.musicbrainz.org/plugins/"
license=('GPL')
depends=('picard')
conflicts=("picard<=${_pkgver}")
source=(git+https://github.com/metabrainz/picard-plugins.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/picard-plugins"
  printf "%s.r%s.%s" "$_pkgver" "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

package() {
  plugindir="${pkgdir}/usr/lib/python2.7/site-packages/picard/plugins"
  cd "$srcdir/picard-plugins/plugins"
  install -d "$plugindir"
  # copy all plugins
  cp -r * "$plugindir"
}

# vim:set ts=2 sw=2 et:
