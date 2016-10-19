# Maintainer: Simon Perry (Pezz) <aur@sanxion.net>

pkgname=shortcircuit
pkgver=0.1.4
pkgrel=2
_reltype='beta'
pkgdesc='A tool for EVE Online that finds the shortest path between solar systems (including wormholes)'
arch=('any')
url='https://github.com/farshield/shortcircuit'
license=('MIT')
depends=('python2' 'python2-requests' 'python2-pyside')
source=("https://github.com/farshield/$pkgname/archive/v.$pkgver-$_reltype.tar.gz"
        ${pkgname}.desktop
        ${pkgname}-start.sh)

package() {
  cd "${srcdir}/${pkgname}-v.${pkgver}-${_reltype}"

  install -d ${pkgdir}/usr/bin
  install -d ${pkgdir}/usr/share/{applications,pixmaps,${pkgname}}
  install -d ${pkgdir}/usr/share/licenses/${pkgname}

  cp -R {resources,src} ${pkgdir}/usr/share/${pkgname}
  install -m 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
  install -m 644 README.md ${pkgdir}/usr/share/${pkgname}
  install -m 644 resources/images/app_icon.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
  install -m 644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -m 755 ${srcdir}/${pkgname}-start.sh ${pkgdir}/usr/bin/${pkgname}
}

md5sums=('0eec71bbb89c871b0f692dc4e4738cc1'
         '284dfed1b0d0996b9b21417b5d9b0019'
         'b1e948a581bb4738724ded5231f71292')
md5sums=('0eec71bbb89c871b0f692dc4e4738cc1'
         '284dfed1b0d0996b9b21417b5d9b0019'
         'b1e948a581bb4738724ded5231f71292')
