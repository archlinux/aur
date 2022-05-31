# Maintainer: taotieren <admin@taotieren.com>
# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

_pkgname=darling
pkgname=darling-bin
pkgver=0.1.20220213
pkgrel=2
pkgdesc="Darwin/macOS emulation layer for Linux"
arch=('x86_64')
url="https://github.com/darlinghq/darling"
license=('GPL')
groups=('darling-bin')
provides=('darling')
conflicts=('darling' 'darling-git')
depends=('anaconda>=2.12.6' 'darling-dkms' 'dbus>=1.9.14' 'ffmpeg-vulkan>=2:4.0'
         'freetype2>=2.2.1' 'fuse2>=2.2' 'giflib>=5.1' 'glibc>=2.14' 'glu' 'libgl'
         'libglvnd' 'libjpeg-turbo>=2.0' 'libpulse>=0.99.1' 'libtiff>=4.0.3'
         'libx11' 'libxcursor>1.1.2' 'libxext' 'libxkbfile>=1.1.0' 'libxrandr')
source=("$url/releases/download/v$pkgver/${_pkgname}_0.1.20220125.focal_amd64.deb")
sha512sums=('53776310c8457eaa2dd9103243e6f82b96c6ba029919b60a7c20a4c093347af335539b699a622c157353ef05461a1e8275d1603d6adc5aca89407ba7acfba51a')
options=('!strip' '!emptydirs')
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
