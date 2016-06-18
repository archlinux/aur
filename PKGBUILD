# Maintainer: delta48 <dark.magician.48+aur[at]gmail[dot]com>
# based on firefox-noscript PKGBUILD

pkgname=firefox-onetab
pkgver=1.17.0
pkgrel=1
pkgdesc="Extension for firefox which convert tabs to a list and reduce browser memory"
arch=('any')
url="http://www.one-tab.com/"
license=('custom')
depends=("firefox")
source=(https://addons.mozilla.org/firefox/downloads/latest/525044/addon-525044-latest.xpi)
md5sums=('2b9f61d241eb7d21b376058e760c9765')

pkgver() {
    sed -n '/.*<em:version>\(.*\)<\/em:version>.*/{s//\1/p;q}' install.rdf | cut -f 1 -d-
}

package() {
    cd $srcdir
    emid="$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)"
    local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/
    install -d $dstdir
    cp *.xpi $dstdir/${emid}.xpi
}
