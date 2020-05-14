# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: Carl George < carl at george dot computer >

pkgname='pop-gtk-theme'
pkgver=5.1.2
pkgrel=1
pkgdesc='System76 Pop GTK+ Theme'
arch=('any')
url='https://github.com/pop-os/gtk-theme'
license=('LGPL2.1' 'CCPL' 'GPL3')
makedepends=('inkscape'
						 'sassc'
						 'optipng'
						 'parallel'
						 'meson'
						 'glib2'
						 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('aa28139ac028eacfe60c6b3cdec6421bc40e36329a6f4846e71fb76711a3fbe8')

build() {
  cd "gtk-theme-${pkgver}"
  meson --prefix='/usr' build
  ninja -C build
}

package() {
  cd "gtk-theme-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build install
}
# vim: ts=2 sw=2 et: