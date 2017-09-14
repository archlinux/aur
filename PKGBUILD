# Maintainer: polylux <polylux@socialnerds.org>
# Contributor: McModder <mcmodder@mcmodder.ru> (created/maintains std svn build)

pkgname=openttd-stable-svn
pkgver=r1.7.1
pkgrel=1
pkgdesc='An engine for running Transport Tycoon Deluxe (latest stable 
SVN build)'
arch=('i686' 'x86_64')
url='http://openttd.org'
license=('GPL')
depends=('libpng' 'sdl' 'icu' 'fontconfig' 'lzo' 'hicolor-icon-theme' 'desktop-file-utils' 'xz')
optdepends=('openttd-opengfx: free graphics' 
            'openttd-opensfx: free soundset'
            'timidity++: for in-game music')
makedepends=('svn')

source=("$pkgname::svn+svn://svn.openttd.org/tags/1.7.1")
sha256sums=('SKIP')

build() {
  cd ${pkgname}

 ./configure \
    --prefix-dir=/usr \
    --binary-name=${pkgname} \
    --binary-dir=bin \
    --data-dir=share/${pkgname} \
    --install-dir=${pkgdir} \
    --doc-dir=share/doc/${pkgname} \
    --menu-name="OpenTTD-stable-svn" \
    --personal-dir=.${pkgname}    

  make
}

package() {
  cd ${pkgname}

  make install
}

