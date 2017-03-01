# Maintainer: Jack O'Connor <oconnor663@gmail.com>

# NOTE: This PKGBUILD is generated and pushed by Keybase's release automation.
# Any changes made in aur.archlinux.org git repos will get overwritten. See
# https://github.com/keybase/client/tree/master/packaging/linux/arch.

pkgname=keybase-bin
pkgdesc='the Keybase Go client, filesystem, and GUI'
license=('BSD')
url='https://keybase.io'
pkgver=1.0.18_20170301190007+3dad37e
pkgrel=1
arch=('i686' 'x86_64')
depends=(fuse gconf libxss)
# keybase-release is a deprecated AUR package
conflicts=(keybase keybase-release keybase-git)
source_i686=(
  "https://s3.amazonaws.com/prerelease.keybase.io/linux_binaries/deb/keybase_1.0.18-20170301190007.3dad37e_i386.deb"
)
source_x86_64=(
  "https://s3.amazonaws.com/prerelease.keybase.io/linux_binaries/deb/keybase_1.0.18-20170301190007.3dad37e_amd64.deb"
)
install=keybase.install

package() {
  if [ "$CARCH" = "i686" ] ; then
    deb_arch="i386"
  elif [ "$CARCH" = "x86_64" ] ; then
    deb_arch="amd64"
  else
    echo "Unknown arch: $CARCH"
    exit 1
  fi

  cd "$srcdir"
  deb_package="keybase_1.0.18-20170301190007.3dad37e_${deb_arch}.deb"
  ar xf "$deb_package"
  tar xf data.tar.xz -C "$pkgdir"

  # Omit the cronjobs that the Debian package includes.
  rm -rf "$pkgdir/etc"
}

sha256sums_i686=(9e04199cfb09fc0cb21492622caea81e0c3c3e1683eacfb1882f28f3e488590d)
sha256sums_x86_64=(289f6b230b2baa7f83baa8b1a18386035286d2e6931085965bcfbfe5d682c39a)
