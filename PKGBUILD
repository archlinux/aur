# Maintainer: Barnabe di Kartola

pkgname=kde-snap-assist
pkgver=1.0.0
pkgrel=1
pkgdesc="This KWin script for KDE Plasma suggests other window thumbnails on snap. It tries to replicate the famous Windows 10/11 feature of the same name."
arch=(any)
url="https://github.com/emvaized/kde-snap-assist"
license=(GPLv3)
depends=(kwin)
source=("git+${url}")
md5sums=(SKIP)

pkgver() {
    cd kde-snap-assist
    vergit=$(git tag | sort | tail -n1 | sed 's|v||')
    echo $vergit
}

package() {
#   cd $srcdir/KWin-window-positioning-scripts
  mkdir -p "${pkgdir}/usr/share/kwin/scripts/"
  cp -R ${srcdir}/${pkgname} "${pkgdir}/usr/share/kwin/scripts/"
  rm -r "${pkgdir}/usr/share/kwin/scripts/${pkgname}/.git"
  rm -r "${pkgdir}/usr/share/kwin/scripts/${pkgname}/.github"
}
