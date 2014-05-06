# Contributor: Johannes Dewender  arch at JonnyJD dot net
pkgname=picard-plugins-git
pkgver=1.2
pkgrel=1
pkgdesc="plugins from picard-git"
arch=('any')
url="http://musicbrainz.org/doc/MusicBrainz_Picard/Plugins"
license=('GPL')
depends=('picard')
conflicts=('picard-git' 'picard>1.2')
source=(
https://raw.github.com/Sophist-UK/Picard-Plugins/master/viewvariables.zip
https://raw.github.com/Sophist-UK/Picard-Plugins/master/albumartist_website.py
https://raw.github.com/Sophist-UK/Picard-Plugins/master/standardise_performers.py
)
md5sums=('faebf9e8ee0e269a67cf4b9a5ca7524e'
         '2e20b62397ad8531e769e9f7c064b6e2'
         'db019df38156eba591658eddcb7c9e97')

package() {
  plugindir="${pkgdir}/usr/lib/python2.7/site-packages/picard/plugins"
  cd "$srcdir"
  install -d "$plugindir"
  install -m644 -t "$plugindir" \
    albumartist_website.py standardise_performers.py

  install -d "$plugindir"/viewvariables
  install -m644 -t "$plugindir"/viewvariables viewvariables/*.{py,ui}
}

# vim:set ts=2 sw=2 et:
