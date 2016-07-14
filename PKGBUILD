# Maintainer: Sébastien Feugère <smonff@riseup.net>
pkgname=gopanda
pkgver=2
pkgrel=2
pkgdesc="GoPanda 2 is a modern client to Pandanet that runs in the browser."
arch=('x86_64')
url="http://pandanet-igs.com/communities/$pkgname$pkgversion"
license=('custom')
depends=('xdg-utils')
# TODO multi arch script
source=("http://pandanet-igs.com/$pkgname$pkgver/installer/stable/linux-64/$pkgname$pkgver-linux-64.tar.gz")
md5sums=('d1fcd13d8de0f2c0331ee0a9cb58a58a')
# Generated using makepkg -g


# build() {
#   cd "$srcdir/GoPanda$pkgver"
#   ./configure --prefix=/usr
#   make
# }

package() {
  cd "GoPanda2"
  make DESTDIR="$pkgdir/" install

  # Run the installation script
  sh "$srcdir/GoPanda2/install.sh"

  # set the installation path...
  install_path="$HOME/.local/bin/GoPanda2"

  # Write the license to the installation path
  license_content="GoPanda2 belongs to Pandanet Inc, all rights reserved.\n\nThe software is delivered \"as is\" and we take no responsibility for\nany problems that arise from usage.\n\nGoPanda2 may be redistributed by third parties only when free of\ncharge or advertisements and without modifications to the\nincluded source code or resource files."


  echo -e $license_content
}
