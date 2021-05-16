# Maintainer: malacology
# Contributor: malacology

pkgname=arlequin
pkgver=3.5.2.2
pkgrel=1
pkgdesc="An Integrated Software for Population Genetics Data Analysis"
arch=('any')
url="http://www.cmpg.unibe.ch/software/arlequin35/"
license=('custom')
depends=(
	'wine'
	'wine_gecko'
	'wine-mono'
  'wget'
  'unzip'
)
source=("arlequin.desktop" "arlequin.png")
md5sums=('36d85969ba4fe3e59b15087cf091e91b'
         '230b156c7c8398218177a31b3db3cb12')

package() {
  install -dm755 "$pkgdir"/usr/share/{arlequin,applications}
  cd "$pkgdir"/usr/share/arlequin
  wget http://www.cmpg.unibe.ch/software/arlequin35/win/WinArl35.zip
  unzip WinArl35.zip
  rm WinArl35.zip
  install -Dm755 ${srcdir}/arlequin.png ${pkgdir}/usr/share/arlequin/arlequin.png
  install -Dm755 ${srcdir}/arlequin.desktop ${pkgdir}/usr/share/applications/arlequin.desktop
}
