#Maintainer Frank Souza <franksouza183@gmail.com>

pkgname=evolvere-icons
pkgver=2.0.0.beta
pkgrel=1
pkgdesc='A consistent, cross-environment, square icon theme'
arch=("any")
url="https://www.opendesktop.org/p/1012541"
license=('custom:CC-BY-4.0')
depends=('hicolor-icon-theme')
optdepends=('breeze-icons: to inherit breeze icons for KDE/Qt applications'
            'gnome-icon-theme: to inherit gnome icons for gtk applications')
source=("https://github.com/franksouza183/Evolvere-Icons/archive/refs/tags/v2.0.0-beta.tar.gz")
provides=("${pkgname}")
conflicts=("${pkgname}")
md5sums=("SKIP")
options=(!strip)

prepare() {
  cd "$srcdir/Evolvere-Icons-2.0.0-beta"
  rm -r Documentation
  rm -r Resources
  mv -f Icons/* .
  cd ..
  mv "$srcdir/Evolvere-Icons-2.0.0-beta" "$srcdir/evolvere-icons"
}

package() {
  install -d ${pkgdir}/usr/share/icons/
  install -Dm644 ${pkgname}/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  rm -rf ${pkgname}/{LICENSE,*.md,*.png,adjust-*,.git}
  cp -r ${pkgname} ${pkgdir}/usr/share/icons/${pkgname}
}
