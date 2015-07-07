# Contributor: Artem Sereda <overmind88@gmail.com>                                                          
# Maintainer: Ferik <djferik at gmail dot com>

pkgname=gcue2tracks
pkgver=0.5.2
pkgrel=3
pkgdesc="Tool for spliting compressed audio CD image to tracks with filling tags from cue sheet info."
arch=('i686' 'x86_64')
url="http://trac-hg.assembla.com/gCue2tracks/wiki" 
license=('GPL')
depends=('pygtk' 'cuetools' 'shntool' 'ffmpeg' 'unzip')
optdepends=('id3v2: For MP3 tagging support')
makedepends=('gettext')
source=("${pkgname}-${pkgver}.tar.gz::https://www.assembla.com/spaces/gCue2tracks/documents/bgg6jqEgGr4PptacwqEsg8/download/bgg6jqEgGr4PptacwqEsg8")

sha256sums=('3a46c3e0c26d143bb9d469ea074a257140aa285e777e83d745e5bab5000cad81')

package() {

cd "${srcdir}/gCue2tracks"

sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
-e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
$(find . -name '*.py')
sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
-e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" gcue2tracks

python2 setup.py install --root=${pkgdir}

chmod +x "${pkgdir}/usr/bin/gcue2tracks"

}