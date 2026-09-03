# Maintainer: Romain Bazile <gromain dot baz at gmail dot com>

pkgname=amap-bin
pkgver=0.34
pkgrel=1
epoch=
pkgdesc="A tool to analyze .MAP files produced by several compilers and report the amount of memory being used by data and code."
arch=('x86_64')
url="http://www.sikorskiy.net/prj/amap/index.html"
license=('freeware')
depends=('gtk3' 'libnotify' 'libpng' 'gcc-libs')
_binname="amap.34.ubuntu2410.x64.GTK"
# upstream nginx resets any connection whose User-Agent matches curl or wget
DLAGENTS=('https::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 -A amap-bin -o %o %u'
          "${DLAGENTS[@]}")
source=("https://www.sikorskiy.net/info/prj/amap/files/${_binname}.gz")
sha256sums=('dc4f253681b037cbc60edcb88de817d09f5e36e135323e2cce641d9d362b3094')


package() {
        install -D -m755 ${srcdir}/${_binname} ${pkgdir}/usr/bin/amap;
}
