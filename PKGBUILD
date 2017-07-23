# Maintainer: GordonGR <ntheo1979@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>  
# Contributor: djgera
# Contributor: Patrick Melo <patrick@patrickmelo.eti.br>

pkgname=geany-plugins-gtk3
_pkgname=geany-plugins
pkgver=1.31
pkgrel=1
pkgdesc='Plugins for Geany'
arch=('x86_64' 'i686')
url='http://plugins.geany.org/'
license=('GPL')
depends=("geany-gtk3>=$pkgver" 'gtkspell3' 'ctpl' 'gpgme' 'vte3' 'desktop-file-utils' 'lua51' 'libgit2' 'python2' 'pygtk')
makedepends=('intltool' 'vala' 'gdb' 'cppcheck' 'libgit2')
optdepends=('hspell: hebrew spell checker')
provides=("geany-plugins")
conflicts=("geany-plugins")
source=("http://plugins.geany.org/${_pkgname}/${_pkgname}-$pkgver.tar.bz2")
md5sums=('808f9048b77fd9704569ed2ba12a56e9')

build() {
cd "${_pkgname}-$pkgver"

# Looking forward to Python 3 being supported instead
export PYTHON=/usr/bin/python2

./configure \
  --prefix=/usr \
  --libexecdir=/usr/lib \
  --enable-gtk3
make 
}

package() {
make -C "${_pkgname}-$pkgver" DESTDIR="$pkgdir" install
}

