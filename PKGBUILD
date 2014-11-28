# Contributor: Dragonlord <dragonlord[at]seznam[.]cz>
pkgname=mm2odt
pkgver=0.8.0
pkgrel=1
pkgdesc="Plugin which exports a FreeMind mindmap to an OOorg format and can use users document templates"
arch=('i686')
url="http://sourceforge.net/projects/mm2odtfreemind/"
license=('GPL')
depends=('freemind>=$pkgver')
makedepends=('unzip')
source=(http://downloads.sourceforge.net/mm2odtfreemind/Plugin_odt_FM$pkgver.zip)
md5sums=('61dc748d262fb95ed2fd56798d9ed925')

build() {
  cd "$startdir/src"
  find . -type f -exec chmod -x {} \;

  install -d "$startdir/pkg/usr/share/freemind/plugins"
  cp -r "$startdir/src/odt" "$startdir/pkg/usr/share/freemind/plugins"
  install -D -m644 "$startdir/src/ExportOdt.xml" \
    "$startdir/pkg/usr/share/freemind/plugins/ExportOdt.xml"
}
