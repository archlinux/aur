# Mainta.iner: mareex <marcus dot behrendt dot 86 at gmail dot com>

pkgname=descartes-breeze
pkgver=1.2
pkgrel=1
pkgdesc="A smooth semi-full-flat theme based on KDE-Next with many improvements"
url=("http://kde-look.org/content/show.php/Descartes+Breeze?content=165578")
arch=('any')
license=('GPL')
depends=('kdebase-workspace')
optdepends=('ttf-comme')
conflicts=('descarted-breeze')
replaces=('descarted-breeze')
source=("${pkgname}-${pkgver}.tar.gz::http://kde-look.org/CONTENT/content-files/165578-Descartes_Breeze_v1.2.tar.gz")
md5sums=('904ac663c210638e2aacbe9cefa1bd11')


package() {
  cd ${srcdir}/Descartes_Breeze_v${pkgver}
  
  cd Aurorae_theme
  for d in $(find ./ -type d)
  do
      mkdir -p ${pkgdir}/usr/share/apps/aurorae/themes/$d
  done
  for f in $(find ./ -type f)
  do
      install -m644 $f ${pkgdir}/usr/share/apps/aurorae/themes/$f
  done
  for f in $(find ./ -type l)
  do
      ln -s $(readlink $f) ${pkgdir}/usr/share/apps/aurorae/themes/$f
  done
  cd ../
  
  cd Cursor_theme
  for d in $(find ./ -type d)
  do
      mkdir -p ${pkgdir}/usr/share/icons/$d
  done
  for f in $(find ./ -type f)
  do
      install -m644 $f ${pkgdir}/usr/share/icons/$f
  done
  for f in $(find ./ -type l)
  do
      ln -s $(readlink $f) ${pkgdir}/usr/share/icons/$f
  done
  rm ${pkgdir}/usr/share/icons/AUTHORS
  cd ../
  
  cd QtCurve_theme
  for d in $(find ./ -type d)
  do
      mkdir -p ${pkgdir}/usr/share/apps/QtCurve/$d
  done
  for f in $(find ./ -type f)
  do
      install -m644 $f ${pkgdir}/usr/share/apps/QtCurve/$f
  done
  for f in $(find ./ -type l)
  do
      ln -s $(readlink $f) ${pkgdir}/usr/share/apps/QtCurve/$f
  done
  cd ../
  
  cd Colors
  for d in $(find ./ -type d)
  do
      mkdir -p ${pkgdir}/usr/share/apps/color-schemes/$d
  done
  for f in $(find ./ -type f -type f)
  do
      install -m644 $f ${pkgdir}/usr/share/apps/color-schemes/$f
  done
  for f in $(find ./ -type l)
  do
      ln -s $(readlink $f) ${pkgdir}/usr/share/apps/color-schemes/$f
  done
  cd ../
  
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  install -D -m644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
  install -D -m644 Cursor_theme/AUTHORS ${pkgdir}/usr/share/licenses/${pkgname}/AUTHORS
}

