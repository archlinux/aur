# Maintainer: taotieren <admin@taotieren.com>
# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

_pkgname=darling
pkgname=$_pkgname-bin
pkgver=0.1.20220704
pkgrel=2
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
source=("$url/releases/download/v$pkgver/${_pkgname}_${pkgver}.focal_amd64.deb")
sha512sums=('6acf5271e25931c0871ed205d0ac0cea9b023b534669aa0491d82a0eb37b13f3970f2c323dffa0e0e4a3b49bb50377c01eb28f9d87f5b142cc5fcd8fd42e40d9')
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
