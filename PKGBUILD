# Based on android-tooks PKGBUILD in community
# (git://git.archlinux.org/svntogit/community.git) which has the following
# header:
#     Maintainer: Anatol Pomozov
#     Contributor: 謝致邦 <Yeking@Red54.com>
#     Contributor: Alucryd <alucryd at gmail dot com>

# Maintainer: Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>

pkgname=mkbootimg
pkgver=31.0.0
_tag=${pkgver}p1 # https://github.com/nmeum/android-tools carries extra patch version on top of the upstream versioning
pkgrel=4
pkgdesc='Tool to create and/or unpack Android boot images'
arch=('any')
url='https://github.com/nmeum/android-tools'
license=(Apache)
# python: for mkbootimg & avbtool scripts
# python2: for unpack_bootimg script
depends=(python python2)
conflicts=('android-tools')
source=(https://github.com/nmeum/android-tools/releases/download/$_tag/android-tools-$_tag.tar.xz)
sha256sums=('51a4c3ba5f16945905449c4bd2c1c781a4df7469f6b7362f8837f4f640d8c7b6')

package() {
  cd android-tools-$_tag

  install -d "$pkgdir"/usr/bin/
  install -m 755 vendor/mkbootimg/mkbootimg.py      "$pkgdir"/usr/bin/mkbootimg
  install -m 755 vendor/mkbootimg/unpack_bootimg.py "$pkgdir"/usr/bin/unpack_bootimg
}
