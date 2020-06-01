# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=mlink
pkgver=1.2.0
pkgrel=1
pkgdesc='A tool connecting mBlock web version to devices'
arch=(x86_64)
url='https://www.mblock.cc/en-us/download'
# main program licence is unknown, but bundled node_modules are various
license=(custom)
# use rpm not deb, because (a) makepkg auto-expands rpms and (b) permissions in rpm are already correct for mlink
# source=("https://dl.makeblock.com/mblock5/linux/mLink-1.2.0-amd64.deb")
source=("https://dl.makeblock.com/mblock5/linux/mLink-1.2.0-1.el7.x86_64.rpm")
sha256sums=('1625de43bd7639ce87c3d0b05bac82336df8860351b35f113f93d0140b830c3b')

prepare() {
  mkdir usr/bin
  ln -s /usr/local/makeblock/mLink/mlink usr/bin/mblock-mlink
}

package() {
  cp -r usr "${pkgdir}"
}
