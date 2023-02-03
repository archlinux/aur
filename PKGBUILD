# Maintainer: taotieren <admin@taotieren.com>
# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

_pkgname=darling
pkgname=$_pkgname-bin-prerel
pkgver=0.1.20220929
_pkgver=0.1.20220929_update_sources_11_5
pkgrel=1
pkgdesc="Darwin/macOS emulation layer for Linux"
arch=('x86_64')
url="https://github.com/darlinghq/darling"
license=('GPL')
groups=('darling-bin')
provides=('darling')
conflicts=('darling' 'darling-git')
depends=('dbus>=1.9.14' 'ffmpeg>=2:4.0' 'freetype2>=2.2.1' 'fuse2>=2.2' 'giflib>=5.1'
         'glibc>=2.14' 'glu' 'libgl' 'libglvnd' 'libjpeg-turbo>=2.0' 'libpulse>=0.99.1'
         'libtiff>=4.0.3' 'libx11' 'libxcursor>1.1.2' 'libxext' 'libxkbfile>=1.1.0'
         'libxrandr')
source=("$url/releases/download/v${_pkgver}/${_pkgname}_${pkgver}.focal_amd64.deb")
sha512sums=('272e9bdd392b1f040c2f34704ece8bdc81acf83c7aa757b0851948a893e2ddcd61695f15e9a031d5b2ee8494795e08b60e990b632b6ef30c4f7ae351802739fb')
options=('!strip')
install=$pkgname.install

package() {
  # Extract package data
  cd "$pkgdir"
  tar xf "$srcdir/data.tar.xz"

  install -Dm644 \
    usr/libexec/darling/System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/share/ri/2.6.0/system/Gem/SpecificationPolicy/validate_licenses-i.ri \
    usr/share/licenses/$pkgname/LICENSE

  install -Dm644 usr/share/doc/darling/copyright \
    usr/share/licenses/$pkgname/COPYRIGHT
}
