pkgname=pocillo-gtk-theme-git
pkgver=0.5
pkgrel=1
pkgdesc='Theme for the Budgie Desktop that has Material Design elements and styled using the Arc colour palette'
arch=('any')
url='https://github.com/UbuntuBudgie/pocillo-gtk-theme'
license=('GPL2')
depends=('gtk-engine-murrine' 'gtk3')
makedepends=('inkscape' 'optipng' 'gtk-engine-murrine' 'gdk-pixbuf2' 'git' 'libsass' 'sassc' 'make' 'glib2' 'libxml2' 'parallel') 
optdepends=('budgie-desktop: The Budgie desktop'
            'gdk-pixbuf2' 'gtk-engine-murrine')
provides=('pocillo-gtk-theme')
conflicts=('pocillo-gtk-theme')
source=('git+https://github.com/UbuntuBudgie/pocillo-gtk-theme.git')
sha256sums=('SKIP')

pkgver() {
  cd pocillo-gtk-theme
  
  git describe --tags | sed 's/-/.r/; s/-g/./'
}

build() {
  cd pocillo-gtk-theme
  
  make
}

package() {
  cd pocillo-gtk-theme
  
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
