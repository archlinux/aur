_pkgname="hnsky"
pkgname="hnsky-hg"
pkgver=4.2.15
pkgrel=1
pkgdesc="Semi professional free planetarium program"
arch=("x86_64")
url='https://sourceforge.net/projects/hnsky/'
license=('GPL3')
makedepends=('lazarus' 'mercurial')
depends=('qt5-base' 'qt5-x11extras' 'qt5pas')
source=("hg+http://hg.code.sf.net/p/${_pkgname}/code")
sha256sums=('SKIP')


build() {
   cd $srcdir/code/synapse
   lazbuild laz_synapse.lpk 
   
   cd $srcdir/code
   lazbuild hnsky_w64.lpi
   lazbuild hnsky_w64_themes.lpi
}

package() {
    mkdir -p "${pkgdir}/opt/${_pkgname}"
    cp -r "${srcdir}/code/${_pkgname}" "${pkgdir}/opt/${_pkgname}/${_pkgname}"
}
