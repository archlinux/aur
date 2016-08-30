# Maintainer: Simon Perry (Pezz) <aur@sanxion.net>

pkgname=shortcircuit
pkgver=0.1.3
pkgrel=1
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

sha256sums=('aa80dcd1ddd20ad3af38e6fd59c3f69b2a531a5625fcd0ca5663d3b57d29c401'
            'c842df29562e69f47f2cab65e05b3d7127b8b6aa835c6f1a0ebc884b6e15fa68'
            'bccc903ac6e467fc52b88aa6260fd3d0ea26420bb26c79f1fd4ce21338f9793b')
