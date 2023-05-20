# Maintainer: BlackCatDevel0per <bcdev@mail.ru>
# https://github.com/BlackCatDevel0per

pkgname=boost-libs_v180
pkgver=1.80.0
pkgrel=1
pkgdesc="Older boost-libs version for old soft support (like anbox-git)"
url="https://boost.org"
arch=('x86_64')
provides=('boost-libs')
license=('custom:BSL')
source=("https://archive.archlinux.org/packages/b/boost-libs/boost-libs-1.80.0-3-x86_64.pkg.tar.zst")
sha512sums=('SKIP')

package() {
  cd usr/lib

  # Move python package
  mv python3.10/site-packages/boost python3.10/site-packages/boost_v180

  # Fix permissions
  find . -type d -exec chmod +rx {} \;
  find . -name '*.so*' -exec chmod +rx {} \;

  # Install boost-libs
  mkdir -p "${pkgdir}"/usr/lib/
  cp -r * "${pkgdir}"/usr/lib/

  cd ../share/licenses/boost-libs
  # Install misc stuff
  install -Dm644 LICENSE_1_0.txt "${pkgdir}"/usr/share/licenses/boost-libs/LICENSE_v180
}
