# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
# Contributor: Guillaume ALAUX <guillaume@archlinux.org>

pkgname=swt-bin
pkgver=4.40
pkgrel=2
_date=202606010713
pkgdesc='An open source widget toolkit for Java'
arch=('x86_64')
url='https://www.eclipse.org/swt/'
license=('EPL-2.0')
depends=('java-runtime>=17' 'libxtst')
optdepends=('glu: support for SWT GLCanvas'
            'gtk3: either gtk3 or gtk4 is required'
            'gtk4: either gtk3 or gtk4 is required')
provides=('swt')
conflicts=('swt')
source=("https://download.eclipse.org/eclipse/downloads/drops4/R-${pkgver}-${_date}/swt-${pkgver}-gtk-linux-${arch}.zip")
sha256sums=('61f6378fbe3dfa94fda78392b851f4fd1238f4b9464e634f4b36294673f18707')

package() {
  install -Dm644 "swt.jar" "$pkgdir/usr/share/java/swt-${pkgver}.jar"
  ln -s "swt-${pkgver}.jar" "$pkgdir/usr/share/java/swt.jar"
  ln -s "swt-${pkgver}.jar" "$pkgdir/usr/share/java/swt${pkgver%%.*}.jar"
}
